{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/ids.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/ids.py': [
          {
            end_line: 36,
            start_line: 31,
          },
          {
            end_line: null,
            start_line: 45,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 31-36 define `_reject_colon` validator that rejects colons in BaseIssueID values. However, this validator is redundant because the pattern constraint on line 44 already excludes colons.\n\nThe pattern `r"^[a-z0-9_-]+$"` only allows lowercase letters, digits, underscores, and hyphens. Colons are not in this character class, so any string containing a colon will fail pattern validation before reaching the `BeforeValidator(_reject_colon)` on line 45.\n\nThe validator function and its usage should be deleted as they add no value beyond what the pattern already enforces.\n',
  should_flag: true,
}
