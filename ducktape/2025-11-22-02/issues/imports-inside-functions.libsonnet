{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/auth.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
        [
          'adgn/src/adgn/agent/runtime/builder.py',
        ],
        [
          'adgn/src/adgn/agent/runtime/infrastructure.py',
        ],
        [
          'adgn/src/adgn/agent/runtime/local_runtime.py',
        ],
        [
          'adgn/src/adgn/agent/server/mcp_routing.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/auth.py': [
          {
            end_line: null,
            start_line: 180,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 439,
            start_line: 438,
          },
          {
            end_line: 476,
            start_line: 475,
          },
        ],
        'adgn/src/adgn/agent/runtime/builder.py': [
          {
            end_line: null,
            start_line: 46,
          },
        ],
        'adgn/src/adgn/agent/runtime/infrastructure.py': [
          {
            end_line: null,
            start_line: 67,
          },
        ],
        'adgn/src/adgn/agent/runtime/local_runtime.py': [
          {
            end_line: null,
            start_line: 40,
          },
        ],
        'adgn/src/adgn/agent/server/mcp_routing.py': [
          {
            end_line: 24,
            start_line: 23,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Six files have imports inside functions instead of at module top, violating PEP 8:\nauth.py line 180 imports json inside `_create_error_response`; server.py lines\n438-439 and 475-476 import FastAPI/auth modules inside functions; builder.py,\ninfrastructure.py, local_runtime.py, and mcp_routing.py have similar patterns.\n\nProblems: Violates PEP 8 style guidelines, hides dependencies (harder to see all\nimports at a glance), import errors caught at runtime instead of module load time,\nworse for static analysis tools, usually indicates bad module organization or\npremature optimization.\n\nMove all runtime imports to the top of each file. If avoiding circular imports,\nrestructure modules to eliminate the cycle or use TYPE_CHECKING guards for type\nannotations only. Benefits: PEP 8 compliance, immediate import error detection,\nclearer dependency visibility, better static analysis.\n',
  should_flag: true,
}
