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
            end_line: null,
            start_line: 304,
          },
        ],
      },
      note: 'try/except used to detect first commit instead of positive check',
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Do not use try/except to detect normal, non-error conditions. Reserve exceptions for unexpected situations.\nThe current \"first commit\" detection relies on catching a diff failure, which can also swallow unrelated errors.\nPrefer a positive repository capability/condition check with early bailout. Example pattern:\n  - If we're in the 90% normal case (without executing a failing operation), run the normal path.\n  - Else, handle the 10% case explicitly.\nAs a reviewer, seeing try/except signals \"what's on fire\" (unexpected), not a routine precondition check.\n",
  should_flag: true,
}
