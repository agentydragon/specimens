{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_policy_validation_reload.py',
        ],
        [
          'adgn/tests/agent/mcp_bridge/test_separated_servers.py',
        ],
        [
          'adgn/tests/agent/mcp_bridge/test_ui_auth.py',
        ],
      ],
      files: {
        'adgn/tests/agent/mcp_bridge/test_separated_servers.py': [
          {
            end_line: 38,
            start_line: 31,
          },
        ],
        'adgn/tests/agent/mcp_bridge/test_ui_auth.py': [
          {
            end_line: 27,
            start_line: 20,
          },
        ],
        'adgn/tests/agent/test_policy_validation_reload.py': [
          {
            end_line: 36,
            start_line: 18,
          },
          {
            end_line: 41,
            start_line: 41,
          },
          {
            end_line: 54,
            start_line: 54,
          },
          {
            end_line: 68,
            start_line: 68,
          },
          {
            end_line: 84,
            start_line: 84,
          },
          {
            end_line: 105,
            start_line: 105,
          },
          {
            end_line: 120,
            start_line: 120,
          },
          {
            end_line: 131,
            start_line: 131,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Three test files duplicate SQLite persistence setup instead of using a shared\nfixture, causing verbose destructuring patterns and inconsistency.\n\n**Duplication locations:**\n- test_policy_validation_reload.py (lines 18-36): Returns tuple requiring\n  destructuring in 7 tests (lines 41, 54, 68, 84, 105, 120, 131)\n- test_separated_servers.py (lines 31-38): Creates persistence in fixture\n- test_ui_auth.py (lines 20-27): Identical pattern to test_separated_servers\n\n**Existing good pattern:** persist/conftest.py (lines 19-29) has clean\npersistence fixture using `SQLitePersistence(tmp_path / "test.db")` +\n`ensure_schema()`. Should be promoted to tests/agent/conftest.py for reuse.\n\n**Fixes:**\n1. Create shared persistence fixture in tests/agent/conftest.py\n2. Split test_policy_validation_reload.py fixtures to avoid tuple destructuring\n3. Update mcp_bridge tests to use shared fixture\n\n**Benefits:** Eliminates duplication, removes verbose destructuring, consistent\npattern across agent tests.\n',
  should_flag: true,
}
