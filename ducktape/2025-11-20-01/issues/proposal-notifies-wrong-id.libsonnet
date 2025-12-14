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
            end_line: 237,
            start_line: 232,
          },
          {
            end_line: 235,
            start_line: 234,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 232-237 define create_proposal that sets new_id = 0 as placeholder, calls\npersistence with that placeholder, and notifies with str(new_id) still as \"0\".\nThe actual database-assigned ID is never retrieved or used.\n\nBug: clients receiving the notification get wrong proposal ID (0), notification\npoints to non-existent proposal, return value at line 237 also wrong (returns 0\ninstead of actual ID), creates data inconsistency between notified and persisted.\n\nFix: create_policy_proposal should return actual database-assigned ID, then notify\nand return that ID. Or if persistence doesn't return ID, refactor it to do so or\nquery for newly created proposal. Comment at lines 234-235 acknowledges the problem.\n\nRelated to issue 023 about proposal_id type inconsistency.\n",
  should_flag: true,
}
