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
            end_line: 922,
            start_line: 906,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The editor flow uses redundant parallel variable names (`final_text` and `content_before`) that mirror each other\nwithout adding clarity. Keep a single source variable to reduce cognitive load and avoid confusion about which\nrepresents the canonical value.\n',
  should_flag: true,
}
