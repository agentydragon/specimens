{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/e2e/test_mcp_concurrent.py',
        ],
      ],
      files: {
        'adgn/tests/agent/e2e/test_mcp_concurrent.py': [
          {
            end_line: 110,
            start_line: 100,
          },
          {
            end_line: 169,
            start_line: 159,
          },
          {
            end_line: 283,
            start_line: 269,
          },
        ],
      },
      note: 'Three instances in test_mcp_concurrent.py',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/e2e/test_mcp_errors.py',
        ],
      ],
      files: {
        'adgn/tests/agent/e2e/test_mcp_errors.py': [
          {
            end_line: 82,
            start_line: 73,
          },
          {
            end_line: 135,
            start_line: 127,
          },
          {
            end_line: 193,
            start_line: 184,
          },
          {
            end_line: 256,
            start_line: 249,
          },
        ],
      },
      note: 'Four instances in test_mcp_errors.py',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/e2e/test_mcp_edge_cases.py',
        ],
      ],
      files: {
        'adgn/tests/agent/e2e/test_mcp_edge_cases.py': [
          {
            end_line: 51,
            start_line: 38,
          },
          {
            end_line: 101,
            start_line: 100,
          },
          {
            end_line: 152,
            start_line: 139,
          },
          {
            end_line: 220,
            start_line: 207,
          },
          {
            end_line: 283,
            start_line: 275,
          },
        ],
      },
      note: 'Five instances in test_mcp_edge_cases.py',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'The pattern of creating stateful mock response handlers (a dict with `{"i": 0}` and an\n`async def responses_create(_req)` function that increments the counter and returns\ntool calls from a sequence) is duplicated 16+ times across the test suite.\n\n**Why this is problematic:**\n- 40+ lines of duplicated code across test suite\n- Each occurrence is essentially identical with minor variations\n- Changes to the pattern must be replicated everywhere\n- Increases maintenance burden and risk of inconsistency\n\n**Fix:** Extract into a shared `make_stateful_responses(responses_factory, response_sequence)`\nhelper in conftest.py or tests/agent/helpers.py that takes a list of (function_name,\nserver_name, params) tuples and returns the stateful handler. This eliminates duplication\nacross all 16+ instances.\n',
  should_flag: true,
}
