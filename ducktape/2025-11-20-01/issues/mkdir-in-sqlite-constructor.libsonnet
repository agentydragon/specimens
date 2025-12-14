{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/cli.py',
        ],
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/cli.py': [
          {
            end_line: 115,
            start_line: 114,
          },
        ],
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: 50,
            start_line: 44,
          },
        ],
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 153,
            start_line: 152,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines cli.py:114-115 and app.py:152-153 manually call db_path.parent.mkdir() before\ninstantiating SQLitePersistence. This duplicated directory setup should be handled\ninternally by SQLitePersistence.__init__.\n\nProblems: violates DRY (every caller must remember mkdir), error-prone (forgetting\nmkdir yields cryptic SQLite errors), leaks implementation detail (callers shouldn't\nneed to know SQLite requires parent directories), multiple call sites risk inconsistency.\n\nMove mkdir(parents=True, exist_ok=True) into SQLitePersistence.__init__ (lines 44-50).\nThis is safe - mkdir is idempotent, and constructors are the right place for ensuring\nprerequisites. Benefits: simpler caller code, single responsibility, consistent behavior\nacross all instances.\n",
  should_flag: true,
}
