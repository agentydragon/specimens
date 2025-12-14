{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: 308,
            start_line: 303,
          },
          {
            end_line: 321,
            start_line: 321,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The Policy table's status column is written with values from two different enums inconsistently:\napprove_policy_proposal (lines 303-308) writes PolicyStatus.ACTIVE and PolicyStatus.SUPERSEDED,\nwhile reject_policy_proposal (line 321) writes ProposalStatus.REJECTED. This means the same\ndatabase column holds a mix of enum values from different types, making queries fragile and\nprone to type errors when instantiating Pydantic models (e.g., PolicyProposal expects\nProposalStatus but may receive PolicyStatus values). These should be merged into a single enum\nrepresenting all policy states (active, superseded, pending, approved, rejected) for a unified\npolicy table that tracks both proposals and active policies. Additionally, the enum could be\nlinked to the ORM using SQLAlchemy's Enum type (which creates a SQL-level CHECK constraint or\nnative enum type) to prevent storing invalid status values and catch misuse at the API boundary.\n",
  should_flag: true,
}
