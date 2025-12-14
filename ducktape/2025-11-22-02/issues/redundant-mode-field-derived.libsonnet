{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: null,
            start_line: 40,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 40 defines `RunningAgent` dataclass with both `mode: AgentMode` and\n`local_runtime: LocalAgentRuntime | None` fields. The mode is completely determined by\nwhether local_runtime exists: `mode = BRIDGE` when `local_runtime = None`,\n`mode = LOCAL` when `local_runtime is not None`.\n\nThis is redundant storage. Mode should be derived from local_runtime presence, not stored\nseparately. Storing both creates risk of inconsistency (can't get out of sync if mode is\ncomputed).\n\nReplace the `mode` field with a property that returns `AgentMode.LOCAL if self.local_runtime\nelse AgentMode.BRIDGE`. Update construction sites to omit the mode parameter. Benefits:\nsingle source of truth, cannot desync, less data to maintain, clear semantic relationship.\n",
  should_flag: true,
}
