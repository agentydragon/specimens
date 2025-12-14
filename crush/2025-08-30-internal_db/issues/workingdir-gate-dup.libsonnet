{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/llm/tools/view.go',
        ],
        [
          'internal/llm/tools/ls.go',
        ],
      ],
      files: {
        'internal/llm/tools/ls.go': [
          {
            end_line: 167,
            start_line: 134,
          },
        ],
        'internal/llm/tools/view.go': [
          {
            end_line: 169,
            start_line: 146,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Both View and LS tools perform the same relative-path check and permission request when the target is outside the working directory. Factor this into a shared helper to avoid duplication and ensure consistent permission behavior and messaging.',
  should_flag: true,
}
