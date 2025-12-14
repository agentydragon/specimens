{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/models/policy_error.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/models/policy_error.py': [
          {
            end_line: 11,
            start_line: 9,
          },
          {
            end_line: 17,
            start_line: 14,
          },
          {
            end_line: 22,
            start_line: 21,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 9-11 define `PolicyErrorCode` enum with `READ_ERROR` and `PARSE_ERROR` values. Lines 14-17\ndefine `PolicyErrorStage` enum with `READ`, `PARSE`, and `TESTS` values. Lines 21-22 in `PolicyError`\nmodel include both `stage: PolicyErrorStage` and `code: PolicyErrorCode` fields.\n\nThese enums are redundant: error code is always stage + "_error" suffix. Having both requires\nkeeping enums in sync when adding stages, creates confusing dual representation, and leaves TESTS\nstage without corresponding error code. PolicyError fields are redundant (code fully determined by stage).\n\nKeep only `PolicyErrorStage` enum. Remove `code` field from `PolicyError` model (lines 21-22) or\nadd `@property def code()` that returns `f"{self.stage}_error"` for backwards compatibility. Alternatively,\nmerge into single unified enum with `READ_ERROR`, `PARSE_ERROR`, `TESTS_ERROR` values. Eliminates\nduplication, easier maintenance, no mismatch risk, complete coverage.\n',
  should_flag: true,
}
