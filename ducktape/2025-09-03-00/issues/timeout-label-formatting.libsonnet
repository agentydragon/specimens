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
            end_line: 799,
            start_line: 792,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The code builds a derived label for timeout:\n\n  timeout_label = (\n    "infinite" if config.timeout is None else f"{int(config.timeout.total_seconds())}s"\n  )\n  print(f"# Resolved model={config.model_str}, timeout={timeout_label}", file=sys.stderr)\n\nThis transformation adds extra code and makes output worse (coarser granularity and an arbitrary "s" suffix),\nwhile providing no extra clarity. Prefer logging the `config.timeout` value directly (or its standard\nrepresentation), and drop this one-off label entirely.\n',
  should_flag: true,
}
