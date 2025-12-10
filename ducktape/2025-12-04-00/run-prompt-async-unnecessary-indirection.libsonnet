local I = import '../../lib.libsonnet';

I.issue(
  expect_caught_from=[
    // Need to see both files to detect:
    // 1. run_prompt_async is only called once (from shared.py)
    // 2. run_check_minicodex_async is only called once (from main.py)
    // 3. Both should be consolidated into main.py
    ['adgn/src/adgn/props/cli_app/shared.py', 'adgn/src/adgn/props/cli_app/main.py'],
  ],
  rationale=|||
    Lines 70-102 in cli_app/shared.py contain unnecessary indirection:
    `run_prompt_async` is only called once and should be inlined.

    Current structure:

    async def run_prompt_async(
        prompt: str,
        server_factories: Mapping[str, Callable[..., FastMCP]],
        client: OpenAIModelProto,
        system_prompt: str = "You are a code agent. Be concise.",
    ) -> AgentResult:
        """Run the prompt using MiniCodex + MCP specs and return an AgentResult."""
        # ~30 lines of implementation
        ...
        return AgentResult(final_text=res_any.text, transcript=transcript)

    async def run_check_minicodex_async(...) -> int:
        wiring = properties_docker_spec(workdir, mount_properties=True)
        server_factories = {wiring.server_name: wiring.server_factory}
        res = await run_prompt_async(prompt, server_factories, client=client)  # ← Only call
        if output_final_message:
            Path(output_final_message).write_text(res.final_text, encoding="utf-8")
        if not final_only and res.final_text:
            print(res.final_text)
        return 0

    Problems:

    1. **Unnecessary abstraction**: `run_prompt_async` is only called once (line 152).
       Extracting a function for single use adds indirection without enabling reuse.

    2. **Misleading generality**: The function signature suggests general-purpose utility
       (arbitrary server_factories, configurable system_prompt) but it's only ever
       called with properties_docker_spec output and default system prompt.

    3. **Unclear boundary**: The split between run_prompt_async and
       run_check_minicodex_async is arbitrary - both are part of the same
       "run check with minicodex" workflow.

    4. **Not actually shared**: `run_check_minicodex_async` itself is only used once
       (cli_app/main.py:148), so placing it in "shared.py" is misleading. The file name
       suggests general-purpose utilities but this is single-use code.

    5. **Dead parameter**: `model` parameter (line 144) is never used in the function
       body. It's passed in from the caller but serves no purpose.

    6. **Dead return value**: The function always returns 0 (line 157), never any other
       value. The caller uses it with `raise typer.Exit(code=rc)` but hardcoded 0
       could be inlined at call site. Should return None instead.

    Suggested fix:

    1. Inline `run_prompt_async` into `run_check_minicodex_async`
    2. Remove dead `model` parameter
    3. Change return type from `int` to `None` (remove `return 0`)
    4. Move `run_check_minicodex_async` from cli_app/shared.py to cli_app/main.py
       (next to its single call site)
    5. At call site: change `raise typer.Exit(code=rc)` to `raise typer.Exit(code=0)`

    After refactoring:

    async def run_check_minicodex_async(
        workdir: Path,
        prompt: str,
        *,
        output_final_message: Path | None,
        final_only: bool,
        client: OpenAIModelProto,
    ) -> None:
        wiring = properties_docker_spec(workdir, mount_properties=True)
        server_factories = {wiring.server_name: wiring.server_factory}

        # Inline run_prompt_async body
        transcript: list[TranscriptItem] = []
        comp = Compositor("compositor")
        for name, factory in server_factories.items():
            server = factory()
            await comp.mount_inproc(name, server)
        run_dir = Path.cwd() / "logs" / "mini_codex" / "agent_runner"
        run_dir = run_dir / f"run_{int(time.time())}_{os.getpid()}"
        run_dir.mkdir(parents=True, exist_ok=True)
        async with Client(comp) as mcp_client:
            agent = await MiniCodex.create(
                mcp_client=mcp_client,
                system="You are a code agent. Be concise.",
                client=client,
                handlers=[OneLineProgressHandler(), TranscriptHandler(events_path=run_dir / "events.jsonl")],
                tool_policy=RequireAnyTool(),
            )
            res_any = await agent.run(prompt)

        res = AgentResult(final_text=res_any.text, transcript=transcript)

        # Original run_check_minicodex_async logic
        if output_final_message:
            Path(output_final_message).write_text(res.final_text, encoding="utf-8")
        if not final_only and res.final_text:
            print(res.final_text)
        # No return statement - function returns None

    Benefits:
    - Eliminates unnecessary abstraction layer
    - Removes dead parameter (model) from signature
    - Removes meaningless return value (always 0)
    - Makes the full workflow visible in one place
    - Puts single-use code next to its call site (main.py)
    - "shared.py" truly contains only shared utilities
    - Easier to understand and modify the complete workflow
  |||,
  filesToRanges={
    'adgn/src/adgn/props/cli_app/shared.py': [[70, 102], [140, 157]],
    'adgn/src/adgn/props/cli_app/main.py': [[148, 148]],
  },
)
