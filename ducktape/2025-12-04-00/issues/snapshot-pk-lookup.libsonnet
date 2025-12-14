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
            start_line: 225,
          },
        ],
      },
      note: 'Uses .filter_by(slug=...).first() for PK lookup',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/sync_specimens.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/sync_specimens.py': [
          {
            end_line: null,
            start_line: 101,
          },
        ],
      },
      note: 'Uses .filter_by(slug=...).one() for PK lookup',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/sync_specimens.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/sync_specimens.py': [
          {
            end_line: null,
            start_line: 118,
          },
        ],
      },
      note: 'Uses .filter_by(slug=...).one() for PK lookup',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: "Snapshot lookups by slug use .filter_by(slug=...).one() or .filter_by(slug=...).first(), but slug is the primary key (see models.py line 153). SQLAlchemy's .get() method should be used for primary key lookups as it's more efficient and clearer: session.get(Snapshot, slug_value).\n",
  should_flag: true,
}
