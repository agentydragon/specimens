{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/status_shared.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/types.py',
        ],
        [
          'adgn/src/adgn/agent/server/protocol.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/types.py': [
          {
            end_line: 21,
            start_line: 17,
          },
        ],
        'adgn/src/adgn/agent/server/protocol.py': [
          {
            end_line: 87,
            start_line: 80,
          },
        ],
        'adgn/src/adgn/agent/server/status_shared.py': [
          {
            end_line: 25,
            start_line: 18,
          },
          {
            end_line: 56,
            start_line: 42,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Three run phase/status enums exist with different granularity, causing name\ncollisions, unclear subset relationships, and lost information when converting.\n\nstatus_shared.py RunPhase (7 states): distinguishes TOOLS_RUNNING from SAMPLING\nvia determine_run_phase() logic (lines 42-56). mcp_bridge/types.py RunPhase\n(3 states): cannot make this distinction. protocol.py RunStatus (7 states):\nlifecycle-focused (STARTING/FINISHED) rather than execution phase.\n\nImpact: Name collision (two RunPhase enums), conversion overhead, coarser enums\nlose information (can't distinguish tool execution from sampling).\n\nUse status_shared.RunPhase everywhere. Delete mcp_bridge RunPhase. If RunStatus\ntracks a different dimension (lifecycle vs execution phase), rename to clarify\n(e.g., AgentLifecycle). For code needing coarser granularity, write mapping\nfunctions from the comprehensive enum.\n\nPrinciple: One enum per dimension, most granular wins. Derive coarser projections\nrather than maintaining multiple enums.\n",
  should_flag: true,
}
