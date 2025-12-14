{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 368,
            start_line: 360,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'cli.py lines 360-368 create identical tasks (update_task, runner, output_task) in\nboth branches of an if-else. Only runner construction differs (master_fd vs None).\n\nProblems: (1) update_task assignment is duplicated identically in both branches,\n(2) runner construction differs only in the master_fd parameter, (3) changes to\ntask creation must be duplicated, (4) similarity obscures what actually differs.\n\nMove common task creation outside the if-else. The branch should decide\npre-commit mode and master_fd value; task creation should happen once after.\nCreate output_task conditionally only if master_fd is not None.\n\nBenefits: DRY (task creation happens once), clearer intent (branch decides\npre-commit mode, task creation is separate), easier maintenance (update in one\nplace), less duplication.\n',
  should_flag: true,
}
