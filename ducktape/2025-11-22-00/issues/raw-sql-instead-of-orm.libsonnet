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
            end_line: 165,
            start_line: 145,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Query (sqlite.py:145-165) uses raw SQL with `text()` instead of SQLAlchemy\nORM constructs. The function executes a SELECT with GROUP BY and COALESCE\nusing string-based column references.\n\nProblems with raw SQL: not type-safe (columns as strings), not portable\n(SQL syntax varies), hard to maintain (refactoring tools don't track\nrenames), poor error messages (runtime vs import time), no IDE navigation.\n\nFix: use SQLAlchemy ORM with `session.query(Run.agent_id, func.coalesce(...)).group_by()`.\nBenefits: type-safe references, database portability, refactoring support,\nbetter errors, IDE navigation.\n",
  should_flag: true,
}
