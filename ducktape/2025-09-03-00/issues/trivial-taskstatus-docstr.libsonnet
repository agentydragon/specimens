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
            end_line: 470,
            start_line: 468,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The docstring "Status of a task." adds no information beyond the class name `TaskStatus` and repeats\nthe obvious. Trivial docstrings like this create noise without signal; remove them.\n',
  should_flag: true,
}
