{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/models/proposal_status.py',
        ],
        [
          'adgn/src/adgn/agent/persist/__init__.py',
        ],
        [
          'adgn/src/adgn/agent/persist/models.py',
        ],
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/approval_policy_bridge.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/approval_policy_bridge.py': [
          {
            end_line: 12,
            start_line: 12,
          },
          {
            end_line: 76,
            start_line: 76,
          },
        ],
        'adgn/src/adgn/agent/models/proposal_status.py': [
          {
            end_line: 10,
            start_line: 6,
          },
        ],
        'adgn/src/adgn/agent/persist/__init__.py': [
          {
            end_line: 58,
            start_line: 54,
          },
        ],
        'adgn/src/adgn/agent/persist/models.py': [
          {
            end_line: 43,
            start_line: 39,
          },
          {
            end_line: 176,
            start_line: 176,
          },
        ],
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: 217,
            start_line: 217,
          },
          {
            end_line: 231,
            start_line: 231,
          },
          {
            end_line: 283,
            start_line: 283,
          },
          {
            end_line: 293,
            start_line: 293,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Two enums exist for policy status: PolicyStatus (persist/__init__.py:54-58, models.py:39-43)\nand ProposalStatus (models/proposal_status.py:6-10). The codebase mixes them inconsistently.\n\nPolicyStatus has ACTIVE, SUPERSEDED, PROPOSED, REJECTED. ProposalStatus has PENDING,\nAPPROVED, REJECTED, ERROR.\n\nsqlite.py mismatches types: creates with ProposalStatus.PENDING (line 217), filters with\nProposalStatus values (231), approves with PolicyStatus.ACTIVE (283), rejects with\nProposalStatus.REJECTED (293). Works at runtime because StrEnum values are strings, but\ntype checker can't catch the mixing.\n\nLine 76 in approval_policy_bridge.py converts PolicyStatus → ProposalStatus when building\nProposalDescriptor, masking the mismatch.\n\nProblems: type confusion (same concept, two incompatible types), lost type safety,\nsemantic mismatch (PENDING vs PROPOSED, APPROVED vs ACTIVE), dead code\n(ProposalStatus.APPROVED never set), maintenance burden.\n\nFix: unify into single enum in shared location with all lifecycle states (PENDING, ACTIVE,\nSUPERSEDED, REJECTED, ERROR). Remove duplicates and runtime conversion. String values\nremain compatible (no DB migration needed).\n",
  should_flag: true,
}
