{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/registry_bridge.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/registry_bridge.py': [
          {
            end_line: 53,
            start_line: 53,
          },
          {
            end_line: 56,
            start_line: 56,
          },
          {
            end_line: 159,
            start_line: 152,
          },
          {
            end_line: 183,
            start_line: 177,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 53: `global_compositor` parameter is typed as `Compositor | None`, but the server's\ncore functionality (creating/deleting agents) depends on having a global compositor to\nmount/unmount agent compositors.\n\nIf None, create_agent (lines 152-159) silently skips mounting. Problems: silent\ndegradation, broken invariant (server purpose is to manage agents in global compositor),\ninconsistent state (agent in registry but not mounted), no error feedback, dead code\npath (never happens in practice).\n\nServer only instantiated in create_global_compositor which always has a compositor.\nNo legitimate use case without one.\n\nFix: make parameter required (`Compositor` not `Compositor | None`), remove defensive\nNone checks in create_agent and delete_agent. Benefits: fail-fast, clear contract,\nsimpler code, type safety, correct errors.\n",
  should_flag: true,
}
