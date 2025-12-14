{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: null,
            start_line: 388,
          },
          {
            end_line: null,
            start_line: 405,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Both resource handlers convert p.status and got.status to ProposalStatus:\n\nLine 388: status=ProposalStatus(p.status)\nLine 405: status=ProposalStatus(got.status)\n\nThis conversion is necessarily redundant:\n\nCase 1: If p.status and got.status are already ProposalStatus, then\nProposalStatus(p.status) is a no-op that should be p.status directly.\n\nCase 2: If p.status is a different type (e.g., string or database enum),\nthis indicates a type inconsistency that should be fixed upstream.\n\nSimilar to finding 024 (ApprovalOutcome vs ApprovalStatus), this suggests\nProposalStatus might have a duplicate in the persistence layer, requiring\nconversion at the boundary.\n\nFix options:\n1. If already ProposalStatus: remove conversion, use status=p.status\n2. If persistence returns different type: unify types - make persistence\n   return ProposalStatus directly, OR move conversion into persistence\n   layer's model so it returns objects with ProposalStatus already set\n3. Most likely: duplicate enums that should be unified\n\nThis is a type correctness issue - types should match at boundaries\nwithout runtime conversion.\n",
  should_flag: true,
}
