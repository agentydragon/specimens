{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/resources.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/resources.py': [
          {
            end_line: 41,
            start_line: 32,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Function read_text_json is a special case of read_text_json_typed with output_type=dict[str, Any].\nHaving both functions creates maintenance burden and API surface bloat.\nEither replace callers to use read_text_json_typed(session, uri, dict[str, Any]) directly, or delegate read_text_json to call read_text_json_typed internally.\nThe preferred approach is to replace callers, as it makes the type contract explicit at each call site.\n',
  should_flag: true,
}
