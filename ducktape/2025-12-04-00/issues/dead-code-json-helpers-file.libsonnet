{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/json_helpers.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/json_helpers.py': null,
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The entire `json_helpers.py` file (68 lines) is dead code. All 4 functions are defined but never called anywhere in the codebase:\n- `read_line_json_dict_async` (async read JSON from stream)\n- `read_line_json_dict` (sync read JSON from stream)\n- `send_line_json_async` (async send JSON to stream)\n- `send_line_json` (sync send JSON to stream)\n\nThese line-delimited JSON helpers are not used by any MCP code. The file should be deleted entirely.\n',
  should_flag: true,
}
