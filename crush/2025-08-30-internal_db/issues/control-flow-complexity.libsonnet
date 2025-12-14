{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/chat.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/chat.go': [
          {
            end_line: 516,
            start_line: 508,
          },
          {
            end_line: 841,
            start_line: 837,
          },
        ],
      },
      note: 'Combine nested type+value checks into single if (e.g., asMsg,ok := item.(MessageCmp); ok && asMsg.GetMessage().ID == messageID) and guard for tc.Spinning with a single condition.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/message/content.go',
        ],
      ],
      files: {
        'internal/message/content.go': [
          {
            end_line: 300,
            start_line: 211,
          },
        ],
      },
      note: 'Flatten nested type/id/finished guards across Content/Reasoning/Finish helper methods to reduce repetition and nesting.',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/app/app.go',
        ],
      ],
      files: {
        'internal/app/app.go': [
          {
            end_line: 319,
            start_line: 310,
          },
        ],
      },
      note: 'Flatten trivial guards when deriving MCP topic; prefer small guard or local helper to reduce nesting in the hot loop.',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'internal/lsp/client.go',
        ],
      ],
      files: {
        'internal/lsp/client.go': [
          {
            end_line: 356,
            start_line: 340,
          },
        ],
      },
      note: 'WaitForServerReady: remove unnecessary else after an early return and use guard clauses.',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'e2e/scenario.go',
        ],
      ],
      files: {
        'e2e/scenario.go': [
          {
            end_line: 201,
            start_line: 196,
          },
        ],
      },
      note: 'Combine E2E_PER_STEP_SECS env read and value check into a single expression (read+parse+validate) to reduce nested conditionals.',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'internal/pubsub/broker.go',
        ],
      ],
      files: {
        'internal/pubsub/broker.go': [
          {
            end_line: 184,
            start_line: 180,
          },
        ],
      },
      note: 'Use short if with initializer: if s := f.String(); s != "" { ... } instead of separate lines.',
      occurrence_id: 'occ-5',
    },
    {
      expect_caught_from: [
        [
          'internal/history/file.go',
        ],
      ],
      files: {
        'internal/history/file.go': [
          {
            end_line: 115,
            start_line: 77,
          },
        ],
      },
      note: 'createWithVersion: flatten UNIQUE-constraint retry guard; use clearer retry loop and guard-clauses to avoid deep nesting.',
      occurrence_id: 'occ-6',
    },
  ],
  rationale: 'Code can be simplified to shorten or reduce nesting without hurting readability. Prefer combining trivial nested conditionals, using early returns/continues, or small guard-clauses to make the happy path obvious (see Early bailout).',
  should_flag: true,
}
