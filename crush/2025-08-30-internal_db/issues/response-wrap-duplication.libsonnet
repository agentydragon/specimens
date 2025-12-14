{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/llm/tools/glob.go',
        ],
      ],
      files: {
        'internal/llm/tools/glob.go': [
          {
            end_line: 134,
            start_line: 133,
          },
        ],
      },
      note: 'Glob tool uses WithResponseMetadata/NewTextResponse at these lines; factor via WrapTextWithMeta.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/bash.go',
        ],
      ],
      files: {
        'internal/llm/tools/bash.go': [
          {
            end_line: 490,
            start_line: 487,
          },
        ],
      },
      note: 'Bash tool wraps stdout/no-output with BashResponseMetadata - use helper to centralize.',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/view.go',
        ],
      ],
      files: {
        'internal/llm/tools/view.go': [
          {
            end_line: 251,
            start_line: 249,
          },
        ],
      },
      note: 'View tool wraps output and ViewResponseMetadata at these lines; extract per-tool helper delegating to WrapTextWithMeta.',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/write.go',
        ],
      ],
      files: {
        'internal/llm/tools/write.go': [
          {
            end_line: 237,
            start_line: 236,
          },
        ],
      },
      note: 'Write tool wraps result with WriteResponseMetadata - consolidate.',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/grep.go',
        ],
      ],
      files: {
        'internal/llm/tools/grep.go': [
          {
            end_line: 177,
            start_line: 175,
          },
        ],
      },
      note: 'Grep wraps matches with GrepResponseMetadata; prefer a per-tool helper.',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/ls.go',
        ],
      ],
      files: {
        'internal/llm/tools/ls.go': [
          {
            end_line: 183,
            start_line: 181,
          },
        ],
      },
      note: 'LS wraps listing output with LSResponseMetadata; centralize call shape.',
      occurrence_id: 'occ-5',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/edit.go',
        ],
      ],
      files: {
        'internal/llm/tools/edit.go': [
          {
            end_line: 269,
            start_line: 267,
          },
          {
            end_line: 406,
            start_line: 404,
          },
          {
            end_line: 545,
            start_line: 543,
          },
        ],
      },
      note: 'Edit tool has multiple wrap sites; provide newEditResult helper that uses WrapTextWithMeta.',
      occurrence_id: 'occ-6',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/multiedit.go',
        ],
      ],
      files: {
        'internal/llm/tools/multiedit.go': [
          {
            end_line: 315,
            start_line: 313,
          },
          {
            end_line: 456,
            start_line: 454,
          },
        ],
      },
      note: 'MultiEdit uses MultiEditResponseMetadata in multiple places; factor to helper.',
      occurrence_id: 'occ-7',
    },
  ],
  rationale: 'Many tools duplicate the pattern `WithResponseMetadata(NewTextResponse(text), SomeResponseMetadata{...})`. Introduce a small helper (e.g., WrapTextWithMeta(text string, meta any) (ToolResponse, error)) and per-tool unexported constructors to reduce duplication and clarify metadata shaping.\n',
  should_flag: true,
}
