{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/db/sql/messages.sql',
        ],
        [
          'internal/db/messages.sql.go',
        ],
      ],
      files: {
        'internal/db/messages.sql.go': [
          {
            end_line: 113,
            start_line: 105,
          },
        ],
        'internal/db/sql/messages.sql': [
          {
            end_line: 11,
            start_line: 6,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Ordering drift: SQL orders ListMessagesBySession by created_at, id (messages.sql lines 6–11),\nbut generated code orders by created_at, rowid (messages.sql.go lines ~105–113). This changes\ntie-breaker semantics and can cause inconsistent ordering.\n\nMinimal fix: align SQL and regenerate sqlc; prefer explicit id ordering.\n',
  should_flag: true,
}
