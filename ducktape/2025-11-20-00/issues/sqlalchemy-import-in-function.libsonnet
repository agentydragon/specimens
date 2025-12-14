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
            start_line: 53,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'File imports sqlalchemy.event inside __init__ method (sqlite.py:53), immediately\nbefore using it to register event listener.\n\nCurrent (lines 53-56):\nfrom sqlalchemy import event\n\n@event.listens_for(self.engine.sync_engine, "connect")\ndef enable_foreign_keys(dbapi_conn, connection_record):\n    ...\n\nThis violates PEP 8 guideline that imports should be at module top.\n\nShould move to top-level imports with other sqlalchemy imports.\n\nReasons for top-level imports:\n- Standard Python convention (PEP 8)\n- Easier to see all module dependencies at a glance\n- No performance benefit to lazy import (module already imported elsewhere)\n- Simpler: no need to remember which imports are inline vs top\n\nOnly valid reasons for inline imports:\n- Circular import resolution\n- Optional dependency (with try/except)\n- Heavy module only used in rare code path\n\nNone of these apply here - sqlalchemy is already imported at top of file.\n',
  should_flag: true,
}
