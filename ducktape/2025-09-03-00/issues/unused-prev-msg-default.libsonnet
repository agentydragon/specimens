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
            end_line: 281,
            start_line: 280,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The parameter is declared with a default that callers never use:\n\n  previous_message: str | None = None\n\nUnused defaults add unnecessary degrees of freedom and complicate API contracts.\nPrefer tightening the signature: drop the default (require an explicit value from callers)\nor make the parameter mandatory only where needed via a higher-level object.\n',
  should_flag: true,
}
