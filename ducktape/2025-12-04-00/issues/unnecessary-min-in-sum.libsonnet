{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/grader.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/grader.py': [
          {
            end_line: 132,
            start_line: 131,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 131-132 use min(1.0, cov.recall_credit) when summing recall credits. The field is already\ncapped at 1.0 by Pydantic's RatioFloat constraint (Field(ge=0.0, le=1.0)), making min() redundant.\n",
  should_flag: true,
}
