{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 293,
            start_line: 293,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 293 converts `rec.status` to `ProposalStatus` enum, suggesting the persistence\nlayer and application layer use different types for the same concept.\n\n**The issue:** `PolicyProposal.status` (persist/__init__.py) is typed as `str`, not\n`ProposalStatus`. Line 293 must convert at the application boundary. This creates drift\nrisk: invalid status strings in the database won't be caught by the type system, and\nruntime errors occur if the database contains unexpected values.\n\n**Fix:** Change `PolicyProposal.status` from `str` to `ProposalStatus` enum. Pydantic\nvalidates on construction. No conversion needed at line 293 - persistence layer enforces\nthe enum, application layer receives typed values.\n\nBenefits: single source of truth, type safety throughout stack, no runtime conversion\nerrors.\n",
  should_flag: true,
}
