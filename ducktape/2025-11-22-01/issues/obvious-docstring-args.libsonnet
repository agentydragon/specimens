{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/registry_bridge.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/approvals_bridge.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/approvals_bridge.py': [
          {
            end_line: 127,
            start_line: 125,
          },
          {
            end_line: 143,
            start_line: 141,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/servers/registry_bridge.py': [
          {
            end_line: 143,
            start_line: 142,
          },
          {
            end_line: 171,
            start_line: 170,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Multiple functions have Args sections in docstrings that simply restate information\nalready obvious from type annotations and parameter names.\n\nExamples: `create_agent(agent_id: AgentID)` documents "Unique identifier for the new\nagent" (obvious from type and name), `approve(call_id: str, reasoning: str | None)`\ndocuments "ID of the tool call" and "Optional reasoning" (obvious from types).\n\nArgs sections should explain WHY or HOW, not WHAT (already clear from signature).\nRemove Args that restate type info. Keep only Args that add non-obvious semantic\ninformation (e.g., retry behavior, validation rules, side effects).\n\nAffected: registry_bridge.py lines 142-143, 170-171; approvals_bridge.py lines 125-127,\n141-143.\n',
  should_flag: true,
}
