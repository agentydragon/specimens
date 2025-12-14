{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/shared.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/shared.py': [
          {
            end_line: 32,
            start_line: 28,
          },
          {
            end_line: null,
            start_line: 45,
          },
          {
            end_line: null,
            start_line: 65,
          },
          {
            end_line: 156,
            start_line: 152,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 28-32 and 45, 65 in cli_app/shared.py contain a dead field:\nAgentResult.transcript is always an empty list and never used.\n\nCurrent code:\n\n@dataclass\nclass AgentResult:\n    final_text: str\n    transcript: list[TranscriptItem]  # ← Never populated, always []\n\nasync def run_prompt_async(...) -> AgentResult:\n    transcript: list[TranscriptItem] = []  # ← Line 45: initialized empty\n    comp = Compositor(\"compositor\")\n    # ... 15 lines of setup and execution ...\n    return AgentResult(final_text=res_any.text, transcript=transcript)  # ← Line 65: still []\n\nasync def run_check_minicodex_async(...) -> int:\n    ...\n    res = await run_prompt_async(prompt, server_factories, client=client)\n    if output_final_message:\n        Path(output_final_message).write_text(res.final_text, encoding=\"utf-8\")  # ← Only uses final_text\n    if not final_only and res.final_text:\n        print(res.final_text)  # ← Only uses final_text\n    return 0\n\nProblems:\n\n1. **Dead field**: `transcript` is initialized to [] at line 45 and never populated.\n   The variable sits unused throughout the function body, then gets returned still empty.\n\n2. **Unnecessary wrapper**: AgentResult exists solely to wrap a string. The transcript\n   field adds no value - it's always empty and never accessed by callers (line 153-156\n   only use res.final_text).\n\n3. **Misleading API**: The presence of a transcript field suggests it contains useful\n   data, but it's always empty. This is confusing for readers and maintainers.\n\n4. **Extra boilerplate**: Requires dataclass definition, importing TranscriptItem type,\n   constructing the wrapper object, and accessing .final_text at call sites.\n\nWhy transcript is dead:\n- TranscriptHandler writes to a file (events.jsonl), not to a returned collection\n- The transcript variable is never passed to anything or appended to\n- There's no mechanism to populate it from the agent execution\n\nSuggested fix:\n\n1. Remove AgentResult class entirely (lines 28-32)\n2. Change run_prompt_async return type from AgentResult to str\n3. Return res_any.text directly (line 65: `return res_any.text`)\n4. Remove transcript variable declaration (line 45)\n5. Update run_check_minicodex_async to use string directly:\n   - Line 152: `final_text = await run_prompt_async(...)`\n   - Line 153: `Path(output_final_message).write_text(final_text, ...)`\n   - Line 155: `if not final_only and final_text:`\n   - Line 156: `print(final_text)`\n\nAfter refactoring:\n\nasync def run_prompt_async(...) -> str:\n    \"\"\"Run the prompt using MiniCodex + MCP specs and return the final text.\"\"\"\n    comp = Compositor(\"compositor\")\n    for name, factory in server_factories.items():\n        server = factory()\n        await comp.mount_inproc(name, server)\n    run_dir = Path.cwd() / \"logs\" / \"mini_codex\" / \"agent_runner\"\n    run_dir = run_dir / f\"run_{int(time.time())}_{os.getpid()}\"\n    run_dir.mkdir(parents=True, exist_ok=True)\n    async with Client(comp) as mcp_client:\n        agent = await MiniCodex.create(\n            mcp_client=mcp_client,\n            system=system_prompt,\n            client=client,\n            handlers=[OneLineProgressHandler(), TranscriptHandler(events_path=run_dir / \"events.jsonl\")],\n            tool_policy=RequireAnyTool(),\n        )\n        res_any = await agent.run(prompt)\n    return res_any.text  # Return string directly\n\nasync def run_check_minicodex_async(...) -> int:\n    wiring = properties_docker_spec(workdir, mount_properties=True)\n    server_factories = {wiring.server_name: wiring.server_factory}\n    final_text = await run_prompt_async(prompt, server_factories, client=client)\n    if output_final_message:\n        Path(output_final_message).write_text(final_text, encoding=\"utf-8\")\n    if not final_only and final_text:\n        print(final_text)\n    return 0\n\nBenefits:\n- Removes dead field that's always empty\n- Eliminates unnecessary wrapper class\n- Simplifies API: function returns what it actually produces (string)\n- Less boilerplate (no dataclass, no .final_text accessor)\n- Clearer intent: the function returns text, not a complex result object\n",
  should_flag: true,
}
