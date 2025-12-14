{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/sync.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/sync.py': [
          {
            end_line: 54,
            start_line: 51,
          },
          {
            end_line: 80,
            start_line: 75,
          },
        ],
      },
      note: 'In sync_snapshots_to_db: snapshot_data dict',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/sync.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/sync.py': [
          {
            end_line: 184,
            start_line: 179,
          },
          {
            end_line: 234,
            start_line: 229,
          },
        ],
      },
      note: 'In sync_issues_to_db: issue_data and fp_data dicts',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Raw dicts are used to collect structured snapshot and issue data instead of using\nPydantic models or dataclasses. This loses type safety and validation at construction time.\n',
  should_flag: true,
}
