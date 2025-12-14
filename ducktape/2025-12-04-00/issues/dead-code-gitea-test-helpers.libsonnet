{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/test_gitea_mirror_server.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/test_gitea_mirror_server.py': [
          {
            end_line: 36,
            start_line: 33,
          },
          {
            end_line: 51,
            start_line: 39,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The test file defines two helper functions that are never used:\n\n1. `_iter(values: list[float])` (lines 33-36)\n   - Generator function that yields values from a list and repeats the last value\n   - Has a defensive \"pragma: no cover\" comment suggesting it was intended as a fallback\n   - Never called by any test\n\n2. `_extract_payload(result)` (lines 39-51)\n   - Helper to extract JSON payloads from MCP tool responses\n   - Handles both dict and tuple (blocks, payload) response formats\n   - Never called by any test\n\nBoth functions are dead code - they have complete implementations but zero call sites.\nThey should be deleted unless there's a plan to use them in future tests (in which case,\nadd those tests first or mark as TODO with explanation).\n\nThese may have been leftovers from earlier test implementations that were refactored\nto use different assertion patterns.\n",
  should_flag: true,
}
