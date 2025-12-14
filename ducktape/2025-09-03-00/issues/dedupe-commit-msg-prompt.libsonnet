{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: 1120,
            start_line: 1110,
          },
          {
            end_line: 1128,
            start_line: 1121,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Two large f-strings differ only in the intro line and optional previous message. Extract a single formatter\nthat builds Requirements and Context once, parameterizing the intro and optional previous-message block.\n\nBenefits: less duplication, easier edits to prompt policy, and consistent structure.\n',
  should_flag: true,
}
