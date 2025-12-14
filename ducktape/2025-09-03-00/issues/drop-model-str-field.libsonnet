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
            end_line: 95,
            start_line: 74,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The config stores a redundant composite `model_str` solely for a debug print, while `provider` and `model_name` already exist.\nPrefer printing provider and model_name directly (e.g., `provider=..., model=...`) and drop `model_str`.\nIf a composite is ever needed, derive `f"{provider}:{model_name}"` at the point of use.\n',
  should_flag: true,
}
