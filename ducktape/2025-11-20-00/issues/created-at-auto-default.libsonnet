{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/models.py': [
          {
            end_line: null,
            start_line: 32,
          },
        ],
      },
      note: 'Agent.created_at field',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/models.py': [
          {
            end_line: null,
            start_line: 119,
          },
        ],
      },
      note: 'ToolCall.created_at field',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/models.py': [
          {
            end_line: null,
            start_line: 153,
          },
        ],
      },
      note: 'Policy.created_at field',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: "SQLAlchemy models define created_at fields without default values, requiring every\ncreation site to manually pass created_at=datetime.now(). SQLAlchemy supports automatic\ntimestamps via server_default=func.now() or default=lambda: datetime.now(UTC).\n\nBenefits of auto-defaults:\n- DRY: timestamp logic in one place\n- Can't forget to set created_at\n- Consistent timestamp source\n- Less code at creation sites\n",
  should_flag: true,
}
