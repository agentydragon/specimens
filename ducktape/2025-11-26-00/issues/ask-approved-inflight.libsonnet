{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/policy_gateway/middleware.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/policy_gateway/middleware.py': [
          {
            end_line: 258,
            start_line: 252,
          },
          {
            end_line: 225,
            start_line: 167,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "When user approves an ASK-case tool call (ContinueDecision at lines 252-258), middleware executes it but does NOT track it in `self._inflight`, making it invisible to `has_inflight_calls()` and `inflight_count()`.\n\nThe ALLOW case (lines 167-225) correctly tracks in _inflight during execution with try/finally cleanup.\n\nProblems: (1) `has_inflight_calls()` returns False even when ASK-approved call is executing, (2) `inflight_count()` doesn't count ASK-approved calls, (3) can't distinguish \"waiting for approval\" vs \"approved and executing\", (4) inconsistent tracking between ALLOW and ASK paths.\n\nMatch the ALLOW pattern: add call to _inflight before execution, clean up in finally block. Both paths should track consistently regardless of whether policy allowed or user approved.\n",
  should_flag: true,
}
