{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/support/assertions.py',
        ],
      ],
      files: {
        'adgn/tests/support/assertions.py': [
          {
            end_line: 48,
            start_line: 47,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 47-48 split the error message across two logger.error calls where a single call with string concatenation would be clearer and more concise. The message parts are always logged together, so they should be combined.\n',
  should_flag: true,
}
