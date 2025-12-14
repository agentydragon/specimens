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
            start_line: 61,
          },
        ],
      },
      note: 'Run.status should use RunStatus enum',
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
            start_line: 90,
          },
        ],
      },
      note: 'Event.type should use EventType enum',
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
            start_line: 152,
          },
        ],
      },
      note: 'Policy.status should use PolicyStatus enum',
      occurrence_id: 'occ-2',
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
            start_line: 178,
          },
        ],
      },
      note: 'ChatMessage.author should use MessageAuthor enum',
      occurrence_id: 'occ-3',
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
            start_line: 179,
          },
        ],
      },
      note: 'ChatMessage.mime should use MessageMimeType enum',
      occurrence_id: 'occ-4',
    },
  ],
  rationale: "SQLAlchemy models declare fields as Mapped[str] with inline comments indicating\nthey should be enum types, but don't use the actual enum types.\n\nAll corresponding enums exist as StrEnum types:\n- PolicyStatus (defined in models.py)\n- RunStatus (server/protocol.py:80)\n- EventType (persist/__init__.py:54)\n\nSQLAlchemy 2.0+ supports native Python Enum mapping. Should use:\nstatus: Mapped[PolicyStatus] = mapped_column(nullable=False)\n\nBenefits:\n- Type safety: can't assign arbitrary strings\n- IDE autocomplete for valid values\n- Runtime validation (can't save invalid values)\n- No need for inline comments listing valid values\n- Consistency with enum definitions\n- Refactoring support\n\nSQLAlchemy automatically maps Python enums to VARCHAR/String columns while\npreserving enum type semantics in Python code.\n\nFor ChatMessage fields (author/mime), if they have fixed sets of valid values,\ncreate MessageAuthor and MessageMimeType enums. If truly arbitrary strings,\nkeep as str but add validation logic explaining why.\n",
  should_flag: true,
}
