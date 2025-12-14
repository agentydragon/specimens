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
            end_line: 208,
            start_line: 202,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The call site constructs a tiny literal object only to pass it to write_text; prefer inlining the single-line construction at the call site for concision and to avoid one-off temporary names.\n\nExample: replace\n  kernelspec = {"name": "python3", "display_name": "Python 3", "language": "python"}\n  (ks_dir / "kernel.json").write_text(json.dumps(kernelspec))\nwith\n  (ks_dir / "kernel.json").write_text(json.dumps({"name": "python3", "display_name": "Python 3", "language": "python"}))\n\nThis reduces lines and the mental map of short-lived temporaries without harming readability for small literal payloads.\n',
  should_flag: true,
}
