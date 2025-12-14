{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py': [
          {
            end_line: 343,
            start_line: 340,
          },
        ],
      },
      note: 'cfg_path computed with Path(..) vs os.path usage; prefer Path APIs',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py': [
          {
            end_line: 123,
            start_line: 122,
          },
        ],
      },
      note: 'cwd handling: prefer Path.cwd()/Path(...) semantics instead of os.getcwd()/os.path',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: "Prefer using pathlib.Path methods (e.g., Path.exists(), Path.cwd(), Path.is_file()) instead of the older os.path / os.getcwd helpers.\n\nBenefits:\n- Stronger typing and clearer semantics: callers see Path objects and don't need ad-hoc conversions.\n- Better cross-platform behavior and richer API (methods for joins, parents, resolves, etc.).\n- Reduces repeated str()/Path(...) conversions spread through call sites.\n\nWhen migrating, prefer accepting/returning Path objects at API boundaries and use Path.* helpers in implementation.\n\nGap note: sometimes it is reasonable to keep values as strings when the entire path value flows as a str through the stack (e.g., an HTTP request param immediately passed to a Docker API that expects strings). The decision is a cost-vs-benefit judgment: use Path where you benefit from pathlib API; avoid needless wrap/unwrap where it buys little.\n",
  should_flag: true,
}
