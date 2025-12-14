{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/approvals_bridge.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/approvals_bridge.py': [
          {
            end_line: 97,
            start_line: 86,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 86-97 contain a verbose if-elif-else chain mapping ApprovalOutcome enum values\nto ApprovalStatus enum values with identical names (APPROVED→APPROVED, REJECTED→REJECTED,\nDENIED→DENIED, ABORTED→ABORTED).\n\nThis identity mapping (same name → same name) suggests either: (1) unify the enums if\nthey represent the same concept (see finding 024 for similar issue), or (2) use\nvalue-based conversion: `ApprovalStatus(record.decision.outcome.value)` with try/except,\nor (3) use a dict mapping if enums must remain separate.\n',
  should_flag: true,
}
