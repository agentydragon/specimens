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
            end_line: 598,
            start_line: 596,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Current guard hides misconfiguration and adds branching:\n\n  if not (precommit_path.exists() and precommit_path.is_file()):\n    return\n\nPrefer checking only existence and letting execution surface errors for non-regular files\n(or raise a specific error). This exposes misconfigurations instead of silently skipping\nand reduces control-flow complexity.\n',
  should_flag: true,
}
