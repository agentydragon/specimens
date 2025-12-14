{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/policy_gateway/middleware.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/policy_gateway/middleware.py': [
          {
            end_line: 158,
            start_line: 150,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 150-158 create a ToolCallRecord with 6 fields (call_id, run_id, agent_id, tool_call,\ndecision=None, execution=None) and assign it to `pending_record`, which is used exactly once\non line 158 for `save_tool_call()`.\n\nSingle-use variables add cognitive overhead without providing value. Inline the construction\ndirectly into the save call to eliminate the unnecessary intermediate variable.\n',
  should_flag: true,
}
