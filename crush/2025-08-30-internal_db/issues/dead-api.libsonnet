{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/history/file.go',
        ],
        [
          'internal/db/querier.go',
        ],
        [
          'internal/db/db.go',
        ],
        [
          'internal/db/files.sql.go',
        ],
      ],
      files: {
        'internal/db/db.go': [
          {
            end_line: 70,
            start_line: 69,
          },
        ],
        'internal/db/files.sql.go': [
          {
            end_line: 216,
            start_line: 206,
          },
          {
            end_line: 220,
            start_line: 218,
          },
        ],
        'internal/db/querier.go': [
          {
            end_line: 26,
            start_line: 26,
          },
        ],
        'internal/history/file.go': [
          {
            end_line: 36,
            start_line: 35,
          },
          {
            end_line: 171,
            start_line: 161,
          },
        ],
        'internal/llm/tools/multiedit_test.go': [
          {
            end_line: 93,
            start_line: 92,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Dead API: ListLatestSessionFiles is defined and wired through the DB layer but has no production callers; it is referenced only by a test fake.\n\nSummary\n- The history service interface exposes ListLatestSessionFiles and forwards to the DB query.\n- The DB layer declares, prepares, and exposes the query.\n- No runtime code consumes it; a test fake implements it by delegating to ListBySession, masking drift.\n\nWhy this matters\n- Unused API surfaces can drift from intended semantics (and already do — global per-path grouping instead of per-(session,path)).\n- Dead code increases maintenance burden and creates footguns for future callers.\n\nAcceptance criteria\n- Either remove the API and associated SQL wiring, or add a real caller and correct the query semantics to per-(session_id,path) latest.\n',
  should_flag: true,
}
