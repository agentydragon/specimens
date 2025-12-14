{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/shared.py',
          'adgn/src/adgn/props/cli_app/main.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/main.py': [
          {
            end_line: 148,
            start_line: 148,
          },
        ],
        'adgn/src/adgn/props/cli_app/shared.py': [
          {
            end_line: 102,
            start_line: 70,
          },
          {
            end_line: 157,
            start_line: 140,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 70-102 in cli_app/shared.py contain unnecessary indirection:\n`run_prompt_async` is only called once and should be inlined.\n\nCurrent structure:\n\nasync def run_prompt_async(\n    prompt: str,\n    server_factories: Mapping[str, Callable[..., FastMCP]],\n    client: OpenAIModelProto,\n    system_prompt: str = \"You are a code agent. Be concise.\",\n) -> AgentResult:\n    \"\"\"Run the prompt using MiniCodex + MCP specs and return an AgentResult.\"\"\"\n    # ~30 lines of implementation\n    ...\n    return AgentResult(final_text=res_any.text, transcript=transcript)\n\nasync def run_check_minicodex_async(...) -> int:\n    wiring = properties_docker_spec(workdir, mount_properties=True)\n    server_factories = {wiring.server_name: wiring.server_factory}\n    res = await run_prompt_async(prompt, server_factories, client=client)  # ← Only call\n    if output_final_message:\n        Path(output_final_message).write_text(res.final_text, encoding=\"utf-8\")\n    if not final_only and res.final_text:\n        print(res.final_text)\n    return 0\n\nProblems:\n\n1. **Unnecessary abstraction**: `run_prompt_async` is only called once (line 152).\n   Extracting a function for single use adds indirection without enabling reuse.\n\n2. **Misleading generality**: The function signature suggests general-purpose utility\n   (arbitrary server_factories, configurable system_prompt) but it's only ever\n   called with properties_docker_spec output and default system prompt.\n\n3. **Unclear boundary**: The split between run_prompt_async and\n   run_check_minicodex_async is arbitrary - both are part of the same\n   \"run check with minicodex\" workflow.\n\n4. **Not actually shared**: `run_check_minicodex_async` itself is only used once\n   (cli_app/main.py:148), so placing it in \"shared.py\" is misleading. The file name\n   suggests general-purpose utilities but this is single-use code.\n\n5. **Dead parameter**: `model` parameter (line 144) is never used in the function\n   body. It's passed in from the caller but serves no purpose.\n\n6. **Dead return value**: The function always returns 0 (line 157), never any other\n   value. The caller uses it with `raise typer.Exit(code=rc)` but hardcoded 0\n   could be inlined at call site. Should return None instead.\n\nSuggested fix:\n\n1. Inline `run_prompt_async` into `run_check_minicodex_async`\n2. Remove dead `model` parameter\n3. Change return type from `int` to `None` (remove `return 0`)\n4. Move `run_check_minicodex_async` from cli_app/shared.py to cli_app/main.py\n   (next to its single call site)\n5. At call site: change `raise typer.Exit(code=rc)` to `raise typer.Exit(code=0)`\n\nAfter refactoring:\n\nasync def run_check_minicodex_async(\n    workdir: Path,\n    prompt: str,\n    *,\n    output_final_message: Path | None,\n    final_only: bool,\n    client: OpenAIModelProto,\n) -> None:\n    wiring = properties_docker_spec(workdir, mount_properties=True)\n    server_factories = {wiring.server_name: wiring.server_factory}\n\n    # Inline run_prompt_async body\n    transcript: list[TranscriptItem] = []\n    comp = Compositor(\"compositor\")\n    for name, factory in server_factories.items():\n        server = factory()\n        await comp.mount_inproc(name, server)\n    run_dir = Path.cwd() / \"logs\" / \"mini_codex\" / \"agent_runner\"\n    run_dir = run_dir / f\"run_{int(time.time())}_{os.getpid()}\"\n    run_dir.mkdir(parents=True, exist_ok=True)\n    async with Client(comp) as mcp_client:\n        agent = await MiniCodex.create(\n            mcp_client=mcp_client,\n            system=\"You are a code agent. Be concise.\",\n            client=client,\n            handlers=[OneLineProgressHandler(), TranscriptHandler(events_path=run_dir / \"events.jsonl\")],\n            tool_policy=RequireAnyTool(),\n        )\n        res_any = await agent.run(prompt)\n\n    res = AgentResult(final_text=res_any.text, transcript=transcript)\n\n    # Original run_check_minicodex_async logic\n    if output_final_message:\n        Path(output_final_message).write_text(res.final_text, encoding=\"utf-8\")\n    if not final_only and res.final_text:\n        print(res.final_text)\n    # No return statement - function returns None\n\nBenefits:\n- Eliminates unnecessary abstraction layer\n- Removes dead parameter (model) from signature\n- Removes meaningless return value (always 0)\n- Makes the full workflow visible in one place\n- Puts single-use code next to its call site (main.py)\n- \"shared.py\" truly contains only shared utilities\n- Easier to understand and modify the complete workflow\n",
  should_flag: true,
}
