{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
        [
          'adgn/src/adgn/agent/server/status_shared.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 249,
            start_line: 249,
          },
          {
            end_line: 253,
            start_line: 253,
          },
        ],
        'adgn/src/adgn/agent/server/status_shared.py': [
          {
            end_line: 56,
            start_line: 42,
          },
          {
            end_line: 163,
            start_line: 162,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "`mcp_has_inflight` parameter is always `False` (runtime.py:249,\nstatus_shared.py:162) with comments \"not exposed\", making\n`RunPhase.TOOLS_RUNNING` unreachable. The `determine_run_phase()`\nfunction checks this parameter but it's always False.\n\nImpact: unreachable enum value, misleading signature (suggests detection\nworks), documentation claims \"MCP tools executing\" but never happens,\nUI may show wrong phase.\n\nOptions: (1) implement tracking (McpManager tracks inflight calls in a\nset, add/remove on call_tool entry/exit), or (2) remove feature (delete\nTOOLS_RUNNING enum value and mcp_has_inflight parameter).\n\nPrinciple: no dead parameters. If a parameter is always constant, either\nimplement the varying logic or remove it.\n",
  should_flag: true,
}
