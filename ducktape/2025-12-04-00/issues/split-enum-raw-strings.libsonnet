{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/prompt_optimizer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/prompt_optimizer.py': [
          {
            end_line: null,
            start_line: 230,
          },
        ],
      },
      note: 'Compares db_snapshot.split == "valid" in validation',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/query_builders.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/query_builders.py': [
          {
            end_line: null,
            start_line: 77,
          },
        ],
      },
      note: 'Query with Snapshot.split == "train"',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/query_builders.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/query_builders.py': [
          {
            end_line: null,
            start_line: 138,
          },
        ],
      },
      note: 'Where clause with Snapshot.split == "train"',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/query_builders.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/query_builders.py': [
          {
            end_line: null,
            start_line: 152,
          },
        ],
      },
      note: 'Where clause with Snapshot.split == "train"',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/query_builders.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/query_builders.py': [
          {
            end_line: null,
            start_line: 225,
          },
        ],
      },
      note: 'Where clause with Snapshot.split == "train"',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/query_builders.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/query_builders.py': [
          {
            end_line: null,
            start_line: 503,
          },
        ],
      },
      note: 'Subquery with Snapshot.split == "valid"',
      occurrence_id: 'occ-5',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/query_builders.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/query_builders.py': [
          {
            end_line: null,
            start_line: 514,
          },
        ],
      },
      note: 'Subquery with Snapshot.split == "valid"',
      occurrence_id: 'occ-6',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/query_builders.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/query_builders.py': [
          {
            end_line: null,
            start_line: 526,
          },
        ],
      },
      note: 'Where clause with Snapshot.split == "valid"',
      occurrence_id: 'occ-7',
    },
  ],
  rationale: 'Multiple SQL queries compare Snapshot.split using raw string literals ("train", "valid") instead of the Split enum (Split.TRAIN, Split.VALID). This bypasses type safety and makes typos harder to catch at static analysis time.\n',
  should_flag: true,
}
