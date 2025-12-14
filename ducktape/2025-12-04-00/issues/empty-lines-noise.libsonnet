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
            end_line: null,
            start_line: 290,
          },
          {
            end_line: null,
            start_line: 308,
          },
          {
            end_line: null,
            start_line: 311,
          },
          {
            end_line: null,
            start_line: 318,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Unnecessary empty lines that add no value to code organization. These lines should be deleted to reduce vertical space without losing readability.\n',
  should_flag: true,
}
