{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/e2e/test_mcp_errors.py',
        ],
      ],
      files: {
        'adgn/tests/agent/e2e/test_mcp_errors.py': [
          {
            end_line: 96,
            start_line: 94,
          },
          {
            end_line: 103,
            start_line: 102,
          },
          {
            end_line: 148,
            start_line: 147,
          },
          {
            end_line: 155,
            start_line: 153,
          },
          {
            end_line: 232,
            start_line: 230,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Multiple uses of `with suppress(Exception):` to hide errors in tests that are meant\nto verify error handling behavior.\n\n**Current pattern (appears 5 times):**\n```python\nwith suppress(Exception):\n    # Server attachment might fail; we're testing error handling\n    requests.patch(base + f\"/api/agents/{agent_id}/mcp\", json={\"attach\": spec})\n```\n\n**Why this is problematic:**\nIf the test is meant to verify error handling, it should explicitly check for expected\nerrors, not suppress all exceptions. Tests that suppress exceptions provide no signal\nwhen they fail - they just silently skip over problems.\n\nWhen an operation is expected to fail in a test:\n- Use `pytest.raises(SpecificException)` to verify the specific error occurs\n- Assert on the error message or error state\n- Don't hide failures with blanket suppression\n\n**Correct approach:**\nRemove `suppress(Exception)` calls. Either:\n1. Assert the operation succeeds (if it should)\n2. Assert the operation fails with specific exception (using pytest.raises)\n3. Verify the system handles the error appropriately (check error state, logs, etc.)\n\nSuppressing all exceptions makes the test unable to detect when something goes wrong.\n",
  should_flag: true,
}
