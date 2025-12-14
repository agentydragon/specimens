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
            end_line: 358,
            start_line: 357,
          },
          {
            end_line: 401,
            start_line: 399,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The \"get proposal or raise KeyError if None\" pattern appears twice:\n\nLines 357-358 (approve_proposal):\nif (got := await self.persistence.get_policy_proposal(...)) is None:\n    raise KeyError(str(proposal_id))\n\nLines 399-401 (proposal_detail):\ngot = await self.persistence.get_policy_proposal(...)\nif got is None:\n    raise KeyError(f\"Proposal {id} not found\")\n\nThis is code duplication. Both:\n1. Call get_policy_proposal()\n2. Check if result is None\n3. Raise KeyError with the proposal ID\n\nThe \"get or None\" version (get_policy_proposal) might not be used anywhere\nwithout this immediate None check. If that's the case, the persistence\nmethod itself should raise.\n\nFix options:\n1. Preferred: Add get_policy_proposal_or_raise() to persistence layer that\n   raises KeyError instead of returning None\n2. Alternative: Add local helper method _get_proposal_or_raise()\n3. Check if nullable version is actually needed - if never called without\n   the None check, delete it and make the main method raise\n\nThis simplifies call sites to: got = await persistence.get_policy_proposal_or_raise(...)\n",
  should_flag: true,
}
