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
            end_line: 475,
            start_line: 475,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `if args.command == \"stdio\"` branch nests the entire stdio handling flow under an if-block, pushing the main (long) path inside an indented branch.\n\nPrefer an early-bailout/inverted form that returns or delegates early when the condition isn't met, so the main path is at the base indentation level. This makes long flows easier to read, reduces cognitive load from deep nesting, and shortens diffs when adding or removing steps in the happy path.\n\nExample: instead of\n  if args.command == \"stdio\":\n      # long stdio flow\n  else:\n      return other_path()\nPrefer\n  if args.command != \"stdio\":\n      return other_path()\n  # long stdio flow (base indentation)\n\nBenefits: flatter control flow, clearer happy path, fewer indentation-driven mistakes.\n",
  should_flag: true,
}
