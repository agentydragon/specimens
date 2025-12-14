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
            end_line: 82,
            start_line: 75,
          },
        ],
      },
      note: 'Error-swallowing in approval loop with `except Exception: break`',
      occurrence_id: 'occ-0',
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
            end_line: 175,
            start_line: 171,
          },
          {
            end_line: 255,
            start_line: 251,
          },
        ],
      },
      note: 'Error-swallowing in optional approval checks with `except Exception: pass`',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Tests use bare `except Exception:` blocks that swallow all errors, hiding real failures.\n\nTwo pattern variations: `except Exception: break` in retry loops (lines 75-82 in\ntest_mcp_concurrent.py) and `except Exception: pass` for optional operations (lines 171-175,\n251-255 in test_mcp_edge_cases.py).\n\nThis hides actual errors during test execution. If operations fail for real reasons (element\nnot found, page crashed, network failure, timeout), the test silently continues and may pass\nwhen it should fail.\n\nRemove try/except entirely if operation should succeed, or catch only specific expected\nexceptions (TimeoutError, ElementNotFoundError). Let real errors propagate. If approvals are\noptional, check conditions explicitly rather than swallowing all errors.\n',
  should_flag: true,
}
