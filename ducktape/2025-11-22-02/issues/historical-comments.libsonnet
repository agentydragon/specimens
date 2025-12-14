{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/compositor_factory.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/compositor_factory.py': [
          {
            end_line: null,
            start_line: 40,
          },
          {
            end_line: null,
            start_line: 45,
          },
        ],
      },
      note: 'Lines 40, 45: "Mount approval policy engine (now an MCP server)", "Mount approvals hub (now an MCP server)"',
      occurrence_id: 'occ-0',
    },
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
            start_line: 209,
          },
          {
            end_line: null,
            start_line: 237,
          },
          {
            end_line: null,
            start_line: 361,
          },
          {
            end_line: null,
            start_line: 363,
          },
          {
            end_line: null,
            start_line: 416,
          },
          {
            end_line: null,
            start_line: 429,
          },
          {
            end_line: null,
            start_line: 431,
          },
          {
            end_line: null,
            start_line: 441,
          },
          {
            end_line: null,
            start_line: 443,
          },
        ],
      },
      note: 'Lines 209, 237, 361, 363: "Notify that..." comments; Line 416: Confusing auth comment with "Actually, we want..."; Lines 429, 431, 441, 443: Implementation detail comments',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Comments reference historical code states or duplicate log messages/method names.\n\nPattern 1 (compositor_factory.py:40, 45): "Mount...engine (now an MCP server)" references historical refactoring state irrelevant after completion.\n\nPattern 2 (server.py:209, 237, 361, 363): "Notify that..." comments duplicate what method names/log messages already convey.\n\nPattern 3 (server.py:416): Confusing middleware comment with "except... Actually, we want..." contradicts itself instead of stating what it does.\n\nThese comments create maintenance burden and must be updated as code changes. Delete them; log messages and method names are sufficient.\n',
  should_flag: true,
}
