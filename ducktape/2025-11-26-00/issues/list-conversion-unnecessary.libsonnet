{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/resources/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/resources/server.py': [
          {
            end_line: 386,
            start_line: 385,
          },
          {
            end_line: 194,
            start_line: 191,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 385-386 call `list(res.contents)` only to pass to `_build_window_payload()`. Creates unnecessary intermediate list and variable.\n\nProblems: (1) unnecessary `list()` conversion, (2) extra line for simple data transformation, (3) `_build_window_payload` signature (lines 191-194) too restrictive with `list` parameter type.\n\nUpdate `_build_window_payload` to accept `Sequence` instead of `list`, then inline at call site (pass `res.contents` directly). If function only needs iteration (not indexing), use `Iterable` instead of `Sequence`.\n',
  should_flag: true,
}
