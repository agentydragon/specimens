{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/status_shared.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/status_shared.py': [
          {
            end_line: 36,
            start_line: 25,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The function `derive_run_phase` (lines 25-36) is defined but never called. It was replaced by `determine_run_phase` (lines 37+) which provides more precise run phase determination by considering both pending approvals AND MCP inflight status.\n\nThe old function only checked pending approvals, returning either IDLE or WAITING_APPROVAL. The new function adds proper IDLE detection (no pending approvals AND no MCP inflight).\n\nSince the old function is completely unused and superseded, it should be deleted.\n',
  should_flag: true,
}
