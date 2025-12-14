{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/models.py': [
          {
            end_line: 307,
            start_line: 307,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 307 uses cast(GradeValidationContext, ctx) after already checking isinstance.\nAfter the isinstance check on line 305, mypy should already know the type.\nThe cast may be unnecessary redundancy.\n',
  should_flag: true,
}
