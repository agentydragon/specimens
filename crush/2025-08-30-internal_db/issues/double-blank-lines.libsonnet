{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/config/config.go',
        ],
      ],
      files: {
        'internal/config/config.go': [
          {
            end_line: 176,
            start_line: 166,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Collapse double blank lines in internal/config/config.go Options struct; keep at most one blank line between logical groups or use a header comment (e.g., "// ---- Tool options ----") with exactly one blank line above it.',
  should_flag: true,
}
