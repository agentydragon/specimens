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
            end_line: 721,
            start_line: 715,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The TTY guard should use an early bailout to avoid unnecessary nesting.\nInstead of nesting the main logic under `if sys.stdout.isatty(): ...`, invert the condition and return/skip when not a TTY, then run the terminal sizing at the base level.\n',
  should_flag: true,
}
