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
            end_line: 55,
            start_line: 44,
          },
          {
            end_line: 298,
            start_line: 288,
          },
        ],
      },
      note: 'Two instances with unimplemented UI element checks and contradictory fallback logic',
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 44-55 and 288-298 in test_mcp_errors.py check for unimplemented UI error elements\n(.error, .alert-error, [data-testid='error-message']) with fallback logic that accepts\ncompletely different behaviors (WS connection status).\n\nThree problems: tests unimplemented features (backend no longer implements those error UI\nelements); swallows all errors with bare `except Exception:` hiding actual test failures;\naccepts contradictory outcomes (either error indicators appear OR WS disconnects - having\nboth as acceptable makes tests meaningless, they pass regardless of what happens).\n\nTests should NOT have fallback logic accepting massively different behaviors. Pick ONE\nexpected behavior per test and assert it happens. Remove tests for unimplemented UI features\nor implement the features first. Remove error-swallowing exception handlers. If testing error\nstates, verify the specific error indicator that actually exists.\n",
  should_flag: true,
}
