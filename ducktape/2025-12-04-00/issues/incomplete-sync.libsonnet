{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/cmd_db.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/cmd_db.py': [
          {
            end_line: 83,
            start_line: 66,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The recreate_database_schema function (line 66) should call sync_all() to ensure\ncomplete synchronization of all data sources (snapshots, issues, detector prompts,\nand model metadata). Currently it only syncs snapshots and issues, omitting detector\nprompts and model metadata that sync_all() handles.\n\nThe function name "_schema" is also misleading since it does more than just schema\noperations - it also syncs data. Renaming to recreate_database() would better reflect\nthat it handles tables, roles, RLS, and data sync.\n',
  should_flag: true,
}
