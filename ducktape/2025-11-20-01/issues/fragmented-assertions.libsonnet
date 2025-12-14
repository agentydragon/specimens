{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_runtime_timeout.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_runtime_timeout.py': [
          {
            end_line: 40,
            start_line: 38,
          },
        ],
      },
      note: 'Multiple separate assertions for object properties (instance type, exit_code, stdout); should use has_properties',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_policy_validation_reload.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_policy_validation_reload.py': [
          {
            end_line: 63,
            start_line: 62,
          },
          {
            end_line: 79,
            start_line: 77,
          },
        ],
      },
      note: 'Multiple assertions to check error messages (length > 0, then substring); should use has_item(contains_string(...))',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/approval_policy/test_policy_resources.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/approval_policy/test_policy_resources.py': [
          {
            end_line: 176,
            start_line: 171,
          },
          {
            end_line: 218,
            start_line: 213,
          },
          {
            end_line: 252,
            start_line: 249,
          },
          {
            end_line: 290,
            start_line: 289,
          },
          {
            end_line: 309,
            start_line: 308,
          },
          {
            end_line: 321,
            start_line: 320,
          },
        ],
      },
      note: 'Individual field assertions instead of structured comparison; should use Pydantic model equality or has_properties',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Tests use multiple separate assertions instead of structured matchers (hamcrest or Pydantic model equality).\n\nBenefits of structured matchers:\n- Single assertion with clear expected structure\n- Better error messages showing which specific property failed or full diff\n- Less verbose code\n- More explicit about intent\n',
  should_flag: true,
}
