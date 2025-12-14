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
            end_line: 465,
            start_line: 463,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '`mtime_s = path.stat().st_mtime` is used once immediately in the condition; inline the expression to\nreduce one-off locals and keep the check compact.\n',
  should_flag: true,
}
