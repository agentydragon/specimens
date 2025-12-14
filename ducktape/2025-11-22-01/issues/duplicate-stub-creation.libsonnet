{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_policy_validation_reload.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_policy_validation_reload.py': [
          {
            end_line: 48,
            start_line: 47,
          },
          {
            end_line: 58,
            start_line: 57,
          },
          {
            end_line: 68,
            start_line: 67,
          },
          {
            end_line: 85,
            start_line: 84,
          },
          {
            end_line: 98,
            start_line: 97,
          },
          {
            end_line: 110,
            start_line: 109,
          },
          {
            end_line: 132,
            start_line: 131,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'All 7 test functions in test_policy_validation_reload.py duplicate the same\nApprovalPolicyAdminServerStub creation pattern: open Client context, create stub\nfrom server and session, call stub method.\n\nThis pattern appears at lines 47, 57, 67, 84, 97, 109, 131. Violates DRY: harder to\nmaintain (changes need 7 updates), more verbose (2-3 extra setup lines per test),\nless focused (setup obscures intent).\n\nFix: create pytest fixture that returns connected stub via asynccontextmanager or\nfunction-scoped fixture with explicit cleanup. Eliminates 14+ duplicate lines.\n',
  should_flag: true,
}
