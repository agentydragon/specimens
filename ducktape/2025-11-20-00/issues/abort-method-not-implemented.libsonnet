{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: 552,
            start_line: 547,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 656,
            start_line: 656,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "MCP abort_agent tool calls agent.abort() method that doesn't exist on MiniCodex.\n\nThe abort_agent tool at agents.py:656 calls:\nawait local_runtime.agent.abort()  # type: ignore[attr-defined]  # TODO: Implement abort() on MiniCodex\n\nThe type ignore and TODO comment explicitly acknowledge the method is missing.\n\nImpact:\n- Calling abort_agent MCP tool raises AttributeError at runtime\n- Tool is unusable despite being exposed to agents/users\n\nThe MiniCodex class only has abort_pending_tool_calls() which synthesizes\nerror results for pending tool calls but doesn't provide a full abort() method.\n\nFix: Implement abort() method on MiniCodex or remove the broken tool.\n",
  should_flag: true,
}
