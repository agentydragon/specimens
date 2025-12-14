{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/models.py': [
          {
            end_line: 8,
            start_line: 8,
          },
        ],
      },
      note: 'Conditional import for type checking inside function body instead of at module top',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/props/conftest.py',
        ],
      ],
      files: {
        'adgn/tests/props/conftest.py': [
          {
            end_line: 15,
            start_line: 1,
          },
        ],
      },
      note: 'Missing DatabaseConfig import at module top',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/models.py': [
          {
            end_line: 22,
            start_line: 20,
          },
        ],
      },
      note: 'TYPE_CHECKING conditional import below normal imports instead of at module top',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Imports not at module top. Per project conventions, all imports should be at module top unless they break a circular dependency (in which case they require a one-line comment explaining the cycle).\n',
  should_flag: true,
}
