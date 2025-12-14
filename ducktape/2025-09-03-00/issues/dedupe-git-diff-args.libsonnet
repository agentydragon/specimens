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
            end_line: 153,
            start_line: 144,
          },
          {
            end_line: 193,
            start_line: 187,
          },
          {
            end_line: 317,
            start_line: 301,
          },
          {
            end_line: 324,
            start_line: 321,
          },
          {
            end_line: 346,
            start_line: 343,
          },
          {
            end_line: 389,
            start_line: 373,
          },
          {
            end_line: 431,
            start_line: 430,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Multiple locations build nearly-identical git diff invocations, differing only by a single flag\n(HEAD vs --cached) while repeating common flags like --name-status / --unified=0 / --stat.\n\nRecommended: compute the common args once and derive the variant:\n- args_common = ["--unified=0"] (or ["--name-status"], ["--stat"]) as applicable\n- head_args = ["HEAD", *args_common]; cached_args = ["--cached", *args_common]\n- For display, join arrays to a printable string; for execution, splat arrays into repo.git.diff(...)\n\nThis removes duplication, reduces drift risk across call sites, and keeps the diff semantics consistent.\n',
  should_flag: true,
}
