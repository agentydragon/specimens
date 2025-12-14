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
            end_line: 807,
            start_line: 792,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Two adjacent `if known.debug:` blocks perform closely related logging/setup:\n\n  if known.debug:\n    print(f"# Resolved model=..., timeout=...", file=sys.stderr)\n\n  if known.debug:\n    console_handler = logging.StreamHandler(sys.stderr)\n    ...\n\nCombine them into a single `if known.debug:` to reduce duplicated conditionals,\ngroup related debug behavior together, and simplify control flow.\n',
  should_flag: true,
}
