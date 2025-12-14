{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/approval_policy/server.py',
        ],
        [
          'adgn/src/adgn/agent/persist/__init__.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/__init__.py': [
          {
            end_line: 87,
            start_line: 82,
          },
        ],
        'adgn/src/adgn/mcp/approval_policy/server.py': [
          {
            end_line: 54,
            start_line: 47,
          },
          {
            end_line: 174,
            start_line: 163,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '`ProposalDetail` (server.py:47-54) and `PolicyProposal` (persist/__init__.py:82-87) are\nduplicate models with identical fields: id, status, created_at, decided_at, content (5 fields,\nsame types, same defaults, same semantics).\n\nProblems: (1) Identical definitions in two places. (2) Changes to proposal structure require\nupdating both. (3) Violates DRY principle. (4) Creates confusion about which to use where.\n(5) PolicyProposal already defined in persistence layer (the right place).\n\nFix: Delete ProposalDetail from server.py, import PolicyProposal from adgn.agent.persist,\nreplace uses: proposal_detail function return type (line 163) and construction (lines 168-174).\n\nBenefits: Single source of truth, eliminates 8 lines of duplication, clearer type hierarchy\n(persistence types used by API layer), changes happen in one place, consistent with how other\npersistence types are reused.\n\nNote: ProposalDescriptor (server.py:40-44) is different - lightweight descriptor WITHOUT\ncontent field, should remain separate.\n',
  should_flag: true,
}
