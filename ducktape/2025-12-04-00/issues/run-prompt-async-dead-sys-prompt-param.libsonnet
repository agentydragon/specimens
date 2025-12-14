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
            end_line: 73,
            start_line: 73,
          },
          {
            end_line: null,
            start_line: 58,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 73 in cli_app/shared.py has a dead parameter:\nsystem_prompt is never set by any caller, only uses default value.\n\nCurrent code:\n\nasync def run_prompt_async(\n    prompt: str,\n    server_factories: Mapping[str, Callable[..., FastMCP]],\n    client: OpenAIModelProto,\n    system_prompt: str = \"You are a code agent. Be concise.\",  # ← Line 73: default value\n) -> AgentResult:\n    \"\"\"Run the prompt using MiniCodex + MCP specs and return an AgentResult.\"\"\"\n    # ... setup code ...\n    async with Client(comp) as mcp_client:\n        agent = await MiniCodex.create(\n            mcp_client=mcp_client,\n            system=system_prompt,  # ← Line 58: used here\n            client=client,\n            handlers=[...],\n            tool_policy=RequireAnyTool(),\n        )\n        res_any = await agent.run(prompt)\n    return AgentResult(final_text=res_any.text, transcript=transcript)\n\nasync def run_check_minicodex_async(...) -> int:\n    ...\n    res = await run_prompt_async(prompt, server_factories, client=client)  # ← Line 152: no system_prompt arg\n    ...\n\nProblem:\n\n**Dead parameter**: system_prompt has a default value but is never explicitly passed\nby any caller (line 152). The parameter suggests configurability but there's no actual\nuse case for varying the system prompt - it's always \"You are a code agent. Be concise.\"\n\nWhy this is dead:\n- Only one call site (line 152)\n- That call site never passes system_prompt argument\n- Default value is always used\n- No evidence of needing different system prompts for different use cases\n\nThis adds false flexibility that's never exercised, making the API look more general\nthan it actually is.\n\nSuggested fix:\n\n1. Remove system_prompt parameter from run_prompt_async signature (line 73)\n2. Inline the literal at the usage site (line 58):\n   `system=\"You are a code agent. Be concise.\"`\n\nAfter refactoring:\n\nasync def run_prompt_async(\n    prompt: str,\n    server_factories: Mapping[str, Callable[..., FastMCP]],\n    client: OpenAIModelProto,\n) -> AgentResult:\n    \"\"\"Run the prompt using MiniCodex + MCP specs and return an AgentResult.\"\"\"\n    # ... setup code ...\n    async with Client(comp) as mcp_client:\n        agent = await MiniCodex.create(\n            mcp_client=mcp_client,\n            system=\"You are a code agent. Be concise.\",  # Inline the literal\n            client=client,\n            handlers=[...],\n            tool_policy=RequireAnyTool(),\n        )\n        res_any = await agent.run(prompt)\n    return AgentResult(final_text=res_any.text, transcript=transcript)\n\nBenefits:\n- Removes unused parameter\n- Makes it clear the system prompt is a constant, not a variable\n- Simpler function signature (3 params instead of 4)\n- Reduces false generality in the API\n- If different system prompts are needed in the future, add the parameter then\n  (YAGNI principle)\n",
  should_flag: true,
}
