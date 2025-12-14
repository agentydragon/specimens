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
            end_line: 71,
            start_line: 67,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `ensure_schema` method unconditionally drops ALL tables before recreating them,\ndestroying all persisted data on every call. The function name suggests safe,\nidempotent behavior (ensuring schema exists), but the implementation calls\n`Base.metadata.drop_all()` followed by `create_all()`.\n\nThis causes complete data loss on every application restart. Production call sites\nin app.py:176 and cli.py:124 invoke this during startup, wiping agents, runs,\nevents, policies, and tool calls each time the server starts.\n\nSQLAlchemy's `create_all()` is already idempotent—it only creates missing tables.\nThe `drop_all()` call serves no purpose except data destruction.\n",
  should_flag: true,
}
