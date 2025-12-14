{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 297,
            start_line: 290,
          },
        ],
      },
      note: 'editRenderer.Render: use guard clause for json unmarshal of params, proceed on happy path.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 344,
            start_line: 335,
          },
        ],
      },
      note: 'multiEditRenderer.Render: use guard clause for params unmarshal.',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 390,
            start_line: 384,
          },
        ],
      },
      note: 'writeRenderer.Render: prefer guard-clause style when unmarshalling params.',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 416,
            start_line: 410,
          },
        ],
      },
      note: 'fetchRenderer.Render: use early bailout on unmarshal error then happy-path.',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 463,
            start_line: 457,
          },
        ],
      },
      note: 'downloadRenderer.Render: prefer guard-clause for metadata/params parsing.',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 488,
            start_line: 483,
          },
        ],
      },
      note: 'globRenderer.Render: use guard-clause pattern.',
      occurrence_id: 'occ-5',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 515,
            start_line: 508,
          },
        ],
      },
      note: 'grepRenderer.Render: prefer early-return on unmarshal error then continue.',
      occurrence_id: 'occ-6',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 543,
            start_line: 535,
          },
        ],
      },
      note: 'lsRenderer.Render: use guard clause for unmarshalling params.',
      occurrence_id: 'occ-7',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 569,
            start_line: 563,
          },
        ],
      },
      note: 'sourcegraphRenderer.Render: prefer guard-clause for params/metadata parsing.',
      occurrence_id: 'occ-8',
    },
  ],
  rationale: 'Many renderer.Render implementations decode JSON params with `if err := json.Unmarshal(...); err == nil { ... }` and then build args inside the success branch. Prefer failing-fast guard clauses (if err := json.Unmarshal(...); err != nil { return fallback } ) and proceed on the happy path to reduce nesting and improve readability. The Bash renderer already uses the guard-clause style.\n',
  should_flag: true,
}
