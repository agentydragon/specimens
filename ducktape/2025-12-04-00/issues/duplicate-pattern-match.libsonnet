{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/cmd_build_bundle.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/cmd_build_bundle.py': [
          {
            end_line: 42,
            start_line: 38,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The expression "any(matches_pattern(f, pattern) for pattern in <list>)" appears\ntwice in apply_gitignore_patterns (lines 38 and 42). This should be extracted to\na local helper function to eliminate duplication and improve readability. The helper\ncould be named something like matches_any_pattern(path, patterns).\n',
  should_flag: true,
}
