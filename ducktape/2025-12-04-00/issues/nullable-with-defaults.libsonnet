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
            end_line: 44,
            start_line: 18,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The apply_gitignore_patterns function accepts include and exclude as list[str] | None,\nthen checks "if include:" and "if exclude:" at lines 37-42. These parameters should\ninstead be Sequence[str] with default=() in the function signature, eliminating the\nneed for None checks. This makes the contract clearer and reduces defensive code.\n',
  should_flag: true,
}
