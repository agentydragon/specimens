{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/client_helpers.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/client_helpers.py': [
          {
            end_line: 62,
            start_line: 50,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Error message construction is duplicated across multiple paths in call_simple_ok.\nThe base error message \"{name} failed\" is constructed separately in the except branch (line 57) and the is_error branch (lines 60-62).\nThis can be DRY'd up by constructing the base message once and appending details as needed:\n- Initialize error = f\"{name} failed\" at the top\n- In except: raise RuntimeError(error + f\": {exc}\") from exc\n- In is_error check: if detail, append to error; raise RuntimeError(error)\n",
  should_flag: true,
}
