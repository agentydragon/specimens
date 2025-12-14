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
            end_line: 154,
            start_line: 153,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Test file has unnecessary `__main__` block.\n\nLines 153-154 in test_policy_validation_reload.py contain:\n```python\nif __name__ == \"__main__\":\n    pytest.main([__file__, \"-v\"])\n```\n\nPytest tests shouldn't have `__main__` blocks. Run with `pytest` command instead. This is an outdated pattern.\n",
  should_flag: true,
}
