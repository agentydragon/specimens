{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/chat/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/chat/server.py': [
          {
            end_line: 5,
            start_line: 5,
          },
          {
            end_line: 37,
            start_line: 29,
          },
          {
            end_line: 283,
            start_line: 171,
          },
          {
            end_line: 189,
            start_line: 182,
          },
          {
            end_line: 200,
            start_line: 191,
          },
          {
            end_line: 213,
            start_line: 202,
          },
          {
            end_line: 229,
            start_line: 215,
          },
          {
            end_line: 283,
            start_line: 237,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 171-283 define `ChatStorePersisted` using raw aiosqlite queries via `_persistence._open()`\ninstead of SQLAlchemy ORM, inconsistent with the rest of the persistence layer.\n\nFive methods use raw SQL: `last_id_async` (SELECT MAX), `get_last_read_async` (SELECT with\nfilters), `append` (INSERT returning lastrowid), `get_message_async` (SELECT by id),\n`read_pending_and_advance` (multiple queries with manual transaction handling).\n\nProblems: inconsistent with codebase patterns (rest of persistence uses SQLAlchemy ORM with\n`_session()` context manager); ORM models (`ChatMessage`, `ChatLastRead`) already exist in\npersist/models.py but aren't used; manual row parsing via `_row_to_message(row: Row)`\n(line 29) instead of automatic ORM mapping; raw SQL with string-based queries is error-prone\n(no type checking); schema changes require manual updates to query strings and row parsers;\nuses private `_open()` method instead of proper `_session()` context manager.\n\nLine 5 imports aiosqlite.Row only for raw SQL approach. Lines 29-37 define the manual\nconverter.\n\nRefactor to use SQLAlchemy ORM: `select(func.max(...))`, `select(...).where(...)`, ORM model\ninstances with `session.add()`/`commit()`. Benefits: consistency, uses existing models (single\nsource of truth), type-safe attribute access, Alembic migration support, better IDE support.\n",
  should_flag: true,
}
