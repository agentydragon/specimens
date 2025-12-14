{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/wrapper.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/wrapper.py': [
          {
            end_line: 466,
            start_line: 460,
          },
          {
            end_line: 485,
            start_line: 476,
          },
          {
            end_line: 508,
            start_line: 508,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Argparse can directly parse filesystem arguments into pathlib.Path objects by using `type=Path` on add_argument.\nPrefer declaring `ap.add_argument('--foo', type=Path, ...)` so callers receive a Path immediately and avoid scattershot `Path(args.foo)` conversions later.\n\nWhy this matters:\n- Tightens contracts: handlers downstream get the correct type without ad-hoc wrapping.\n- Reduces one-off conversions and improves readability.\n- Avoids small bugs where a string path is treated differently than a Path (e.g., path / os.PathLike handling).\n",
  should_flag: true,
}
