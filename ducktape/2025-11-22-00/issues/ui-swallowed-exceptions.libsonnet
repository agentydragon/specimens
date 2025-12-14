{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/features/agents/stores.ts',
        ],
        [
          'adgn/src/adgn/agent/web/src/features/chat/channels.ts',
        ],
        [
          'adgn/src/adgn/agent/web/src/features/chat/stores_channels.ts',
        ],
        [
          'adgn/src/adgn/agent/web/src/shared/prefs.ts',
        ],
        [
          'adgn/src/adgn/agent/web/src/shared/token.ts',
        ],
        [
          'adgn/src/adgn/agent/web/src/shared/markdown.ts',
        ],
        [
          'adgn/src/adgn/agent/web/src/features/mcp/schema.ts',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/features/agents/stores.ts': [
          {
            end_line: 38,
            start_line: 36,
          },
        ],
        'adgn/src/adgn/agent/web/src/features/chat/channels.ts': [
          {
            end_line: 77,
            start_line: 76,
          },
        ],
        'adgn/src/adgn/agent/web/src/features/chat/stores_channels.ts': [
          {
            end_line: 120,
            start_line: 120,
          },
        ],
        'adgn/src/adgn/agent/web/src/features/mcp/schema.ts': [
          {
            end_line: 49,
            start_line: 49,
          },
        ],
        'adgn/src/adgn/agent/web/src/shared/markdown.ts': [
          {
            end_line: 6,
            start_line: 6,
          },
          {
            end_line: 36,
            start_line: 36,
          },
        ],
        'adgn/src/adgn/agent/web/src/shared/prefs.ts': [
          {
            end_line: 27,
            start_line: 27,
          },
          {
            end_line: 35,
            start_line: 35,
          },
        ],
        'adgn/src/adgn/agent/web/src/shared/token.ts': [
          {
            end_line: 11,
            start_line: 11,
          },
          {
            end_line: 23,
            start_line: 23,
          },
          {
            end_line: 35,
            start_line: 35,
          },
          {
            end_line: 46,
            start_line: 46,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Seven UI modules use empty catch blocks without logging, making failures invisible:\nstores.ts lines 36-38 (agent polling), channels.ts lines 76-77 (WebSocket ops),\nstores_channels.ts line 120 (error handling itself), prefs.ts lines 27/35\n(localStorage), token.ts lines 11/23/35/46 (token parsing), markdown.ts lines 6/36\n(syntax highlighting), schema.ts line 49 (JSON parsing).\n\nProblems: Users see degraded functionality with no error indication, developers\ncannot diagnose failures (API problems, storage issues, validation errors),\ndebugging requires adding logging and reproducing the issue, silent failures mask\nroot causes.\n\nAdd contextual logging to all catch blocks: console.error for critical failures,\nconsole.warn for expected but notable issues, console.debug for graceful degradation.\nBetter: combine logging with user-visible feedback (toasts, error indicators) for\noperations affecting user experience.\n',
  should_flag: true,
}
