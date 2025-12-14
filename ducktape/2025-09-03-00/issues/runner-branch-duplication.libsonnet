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
            end_line: 621,
            start_line: 590,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'ParallelTaskRunner.create_and_run duplicates runner construction and update loop across branches; only output streaming differs.\nPrefer a single shared trunk: compute precommit_task (real or noop) and master_fd, construct the runner once, start the update loop once, and stream output only if master_fd is not None. This keeps the main path flat (early bailout for no-precommit).\n',
  should_flag: true,
}
