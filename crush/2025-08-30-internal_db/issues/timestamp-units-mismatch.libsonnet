{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/db/sql/messages.sql',
          'internal/db/messages.sql.go',
        ],
        [
          'internal/db/files.sql.go',
        ],
      ],
      files: {
        'internal/db/files.sql.go': [
          {
            end_line: 24,
            start_line: 18,
          },
        ],
        'internal/db/messages.sql.go': [
          {
            end_line: 270,
            start_line: 260,
          },
        ],
        'internal/db/migrations/20250424200609_initial.sql': null,
        'internal/db/migrations/20250829011000_use_microsecond_timestamps.sql': null,
        'internal/db/sql/messages.sql': [
          {
            end_line: 24,
            start_line: 19,
          },
          {
            end_line: 33,
            start_line: 31,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Timestamp units are inconsistent across SQL sources, generated sqlc code, and (by extension) calling Go code.\n\nFindings (evidence excerpts):\n- messages.sql uses microseconds (julianday × 86400000000) for created_at/updated_at.\n- messages.sql.go (generated) still updates updated_at using seconds via strftime('%s','now').\n- files.sql.go uses microseconds for created_at/updated_at in INSERT, diverging from messages.\n\nWhy it matters\n- Delta/watermark queries that rely on created_at/updated_at ordering can break (skips/duplicates, out-of-order).\n- Mixed units undermine tie-breaking semantics in (updated_at, id) ordered scans.\n\nAcceptance criteria\n- Pick a single unit (prefer microseconds) for all created_at/updated_at writes.\n- Align SQL and regenerate sqlc so generated code matches sources.\n- Re-run ordering/delta queries to confirm monotonic ordering and stable pagination.\n\nNotes\n- Ordering drift (created_at, rowid) is filed separately; this issue is strictly about unit consistency.\n",
  should_flag: true,
}
