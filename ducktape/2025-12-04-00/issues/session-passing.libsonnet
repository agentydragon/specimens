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
            end_line: 63,
            start_line: 47,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Inconsistent session management: sync_detector_prompts() and sync_model_metadata()\ndon't take a session parameter, while sync_snapshots_to_db() and sync_issues_to_db() do.\nThis forces sync_all() to open a session for only 2 of 4 operations, then call the\nother 2 outside the session context.\n\nAll four sync functions should take a session parameter for consistency, allowing\nsync_all() to be written as a single with-block that inlines the FullSyncResult\nconstruction with all four calls inside the session context.\n",
  should_flag: true,
}
