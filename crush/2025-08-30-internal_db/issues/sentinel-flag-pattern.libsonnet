{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/shell/shell.go',
        ],
      ],
      files: {
        'internal/shell/shell.go': [
          {
            end_line: 201,
            start_line: 183,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'ArgumentsBlocker in internal/shell/shell.go uses a sentinel flag inside an inner loop to decide post-loop behavior. Prefer a labeled continue to skip to the next outer iteration and keep the happy-path less indented.',
  should_flag: true,
}
