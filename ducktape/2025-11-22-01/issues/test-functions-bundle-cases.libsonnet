{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/persist/test_integration.py',
        ],
      ],
      files: {
        'adgn/tests/agent/persist/test_integration.py': [
          {
            end_line: 476,
            start_line: 355,
          },
          {
            end_line: 640,
            start_line: 533,
          },
          {
            end_line: 351,
            start_line: 288,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Test functions bundle multiple independent cases that should be split or parameterized.\n\n**Three forms:**\n\n1. Lines 355-476: 5 sequential subtests (text content, image content, error content,\n   mixed, empty). Each creates CallToolResult, saves, retrieves, asserts independently.\n\n2. Lines 533-640: 4+ sequential subtests (corrupt JSON, missing field, non-existent\n   call_id, malformed timestamp). Each manipulates database, asserts different errors.\n\n3. Lines 288-351: Loop iterating over 6 outcome scenarios (POLICY_ALLOW,\n   POLICY_DENY_ABORT, USER_APPROVE, etc.).\n\n**Problems:**\n- If case N fails, cases N+1 never run\n- Can't identify which scenario failed from test name\n- Can't run individual cases via `pytest -k`\n- Violates pytest convention (one test = one thing)\n- No parallel execution even with pytest-xdist\n\n**Fix:** Split sequential subtests into separate functions with descriptive names\n(e.g., `test_calltoolresult_text_content`). For loops, use `@pytest.mark.parametrize`.\nBenefits: failure isolation, clear names, individual execution, parallel support.\n",
  should_flag: true,
}
