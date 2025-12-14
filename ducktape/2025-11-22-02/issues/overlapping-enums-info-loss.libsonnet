{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
        [
          'adgn/src/adgn/agent/persist/__init__.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 76,
            start_line: 70,
          },
          {
            end_line: 181,
            start_line: 175,
          },
        ],
        'adgn/src/adgn/agent/persist/__init__.py': [
          {
            end_line: 42,
            start_line: 36,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Two overlapping enums exist: `ApprovalOutcome` (persist/__init__.py:36 with values like `POLICY_ALLOW`,\n`USER_APPROVE`, etc.) and `ApprovalStatus` (approvals.py:70-76 with values `PENDING`, `APPROVED`, `REJECTED`,\netc.). Lines 175-181 define `map_outcome_to_status()` converter that tries `ApprovalStatus(outcome.value)`,\ncatches ValueError, and returns `REJECTED` as fallback.\n\nConverter ALWAYS fails: tries to construct `ApprovalStatus(\"policy_allow\")` which doesn't exist in enum,\nsilently returns REJECTED for every input. This causes systematic information loss: `ApprovalOutcome`\ncaptures WHAT (allow/deny/abort) and WHO (POLICY_/USER_ prefix), but `ApprovalStatus` loses WHO information.\nCan't distinguish \"policy auto-approved\" from \"user explicitly approved after review\" - breaks audit trails,\nanalytics, debugging, and compliance.\n\nUse single unified type preserving both outcome and source: either comprehensive enum with `POLICY_APPROVED`,\n`USER_APPROVED`, etc., or separate `Decision(outcome: DecisionOutcome, source: DecisionSource)` model.\nEliminates need for converters with error-hiding fallbacks.\n",
  should_flag: true,
}
