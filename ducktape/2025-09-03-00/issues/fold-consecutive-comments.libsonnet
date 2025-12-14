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
            end_line: 627,
            start_line: 625,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Two consecutive comment lines describe a single obvious condition; fold them into one concise\ncomment immediately above the code to avoid line waste while preserving clarity.\n',
  should_flag: true,
}
