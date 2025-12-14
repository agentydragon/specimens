{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/policy_eval/runner.py',
        ],
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: 246,
            start_line: 246,
          },
        ],
        'adgn/src/adgn/agent/policy_eval/runner.py': [
          {
            end_line: 45,
            start_line: 44,
          },
        ],
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 578,
            start_line: 577,
          },
          {
            end_line: 594,
            start_line: 592,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Four locations create intermediate variables used only once in the immediately\nfollowing statement: runner.py lines 44-45 assign cmd/env before passing to\ncontainers.create; cli.py lines 577-578 assign edit_path before write_text;\ncli.py lines 592-594 assign saved boolean before if check; sqlite.py line 246\nassigns policies before list comprehension.\n\nProblems: One-off variables add cognitive load, provide no semantic value (names\ndon't clarify intent), require extra lines to read, unnecessarily widen variable\nscope.\n\nInline values directly at their use sites. Benefits: fewer variables to track,\nmore concise code, clearer single-use intent, smaller variable scope.\n",
  should_flag: true,
}
