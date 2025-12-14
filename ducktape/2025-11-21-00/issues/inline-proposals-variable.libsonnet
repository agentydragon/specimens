{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/approval_policy/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/approval_policy/server.py': [
          {
            end_line: 160,
            start_line: 148,
          },
          {
            end_line: 151,
            start_line: 151,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 151 assigns database query result to `proposals` variable, which is used exactly once\nin the list comprehension on lines 152-160. Single-use variables add cognitive overhead\nwithout providing value.\n\nInline the query directly into the comprehension: move the `await` expression into the\n`for p in ...` clause. This is valid Python syntax and makes it clearer that the query\nresult is only used for the comprehension.\n',
  should_flag: true,
}
