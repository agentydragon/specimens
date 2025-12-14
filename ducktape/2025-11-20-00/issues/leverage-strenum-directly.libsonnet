{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: null,
            start_line: 192,
          },
          {
            end_line: null,
            start_line: 207,
          },
          {
            end_line: null,
            start_line: 208,
          },
          {
            end_line: null,
            start_line: 213,
          },
          {
            end_line: null,
            start_line: 301,
          },
          {
            end_line: null,
            start_line: 302,
          },
          {
            end_line: null,
            start_line: 306,
          },
          {
            end_line: null,
            start_line: 342,
          },
          {
            end_line: null,
            start_line: 356,
          },
          {
            end_line: null,
            start_line: 381,
          },
        ],
      },
      note: 'Multiple .value calls on PolicyStatus and ApprovalStatus enums in SQLAlchemy queries and assignments',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/history.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/history.py': [
          {
            end_line: null,
            start_line: 36,
          },
        ],
      },
      note: '.value call on StrEnum in history module',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Code explicitly calls .value on StrEnum instances, but StrEnum automatically\ncoerces to its string value in string contexts.\n\nPattern like PolicyStatus.ACTIVE.value in WHERE clauses is unnecessary\nverbosity. Should use PolicyStatus.ACTIVE directly in SQLAlchemy comparisons\nand assignments.\n\nBenefits:\n- Cleaner code: leverages StrEnum design\n- Type safety: keeps enum type longer in data flow\n- Refactoring support: easier to rename enum members\n',
  should_flag: true,
}
