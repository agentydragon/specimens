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
            end_line: 884,
            start_line: 884,
          },
          {
            end_line: 918,
            start_line: 918,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '`commit_msg_path = Path(repo.git_dir) / "COMMIT_EDITMSG"` is declared many lines before its only use.\nDeclare variables as close as possible to their first use to improve locality and reduce mental overhead.\nMove this assignment down to the point where it is used.\n',
  should_flag: true,
}
