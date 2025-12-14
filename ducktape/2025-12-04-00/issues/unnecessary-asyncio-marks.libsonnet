{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_compaction.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_compaction.py': [
          {
            end_line: 39,
            start_line: 39,
          },
          {
            end_line: 92,
            start_line: 92,
          },
          {
            end_line: 119,
            start_line: 119,
          },
          {
            end_line: 149,
            start_line: 149,
          },
        ],
      },
      note: 'Four unnecessary asyncio marks',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/approval_policy/test_preset_policy_loading.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/approval_policy/test_preset_policy_loading.py': [
          {
            end_line: 59,
            start_line: 59,
          },
          {
            end_line: 79,
            start_line: 79,
          },
          {
            end_line: 98,
            start_line: 98,
          },
          {
            end_line: 112,
            start_line: 112,
          },
          {
            end_line: 132,
            start_line: 132,
          },
          {
            end_line: 149,
            start_line: 149,
          },
        ],
      },
      note: 'Six unnecessary asyncio marks',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/props/bundles/test_bundle_validation.py',
        ],
      ],
      files: {
        'adgn/tests/props/bundles/test_bundle_validation.py': [
          {
            end_line: 101,
            start_line: 101,
          },
          {
            end_line: 117,
            start_line: 117,
          },
          {
            end_line: 131,
            start_line: 131,
          },
          {
            end_line: 154,
            start_line: 154,
          },
          {
            end_line: 195,
            start_line: 195,
          },
        ],
      },
      note: 'Five unnecessary asyncio marks',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: "The test suite has `asyncio_mode = \"auto\"` configured in pyproject.toml, which means\npytest-asyncio automatically detects and runs async test functions without requiring\nexplicit `@pytest.mark.asyncio` decorators.\n\nFrom pyproject.toml:196:\n  asyncio_mode = \"auto\"\n\nWith this setting, all `@pytest.mark.asyncio` marks are redundant and should be removed.\npytest-asyncio's auto mode will automatically:\n- Detect async def test functions\n- Create appropriate event loops\n- Run them as async tests\n\nThe marks add visual noise and maintenance burden (must remember to add them) without\nproviding any value when auto mode is enabled.\n\nThis affects numerous test files across the codebase. Here are representative examples\nshowing the pattern:\n\n- test_compaction.py: 4 unnecessary marks\n- test_preset_policy_loading.py: 6 unnecessary marks\n- test_bundle_validation.py: 5 unnecessary marks\n- test_agents_server.py: 5 unnecessary marks\n- test_integration.py: 13 unnecessary marks\n- And many more across the test suite\n\nAll of these marks should be removed since they're redundant with auto mode.\n\nReference: https://pytest-asyncio.readthedocs.io/en/latest/reference/configuration.html#asyncio-mode\n",
  should_flag: true,
}
