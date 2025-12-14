{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/gepa/gepa_adapter.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/gepa/gepa_adapter.py': [
          {
            end_line: 66,
            start_line: 66,
          },
        ],
      },
      note: 'SnapshotInput.target_files uses set[Path] but other path parameters like specimen_slug are plain str',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/cmd_build_bundle.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/cmd_build_bundle.py': [
          {
            end_line: 44,
            start_line: 18,
          },
          {
            end_line: 62,
            start_line: 47,
          },
          {
            end_line: 363,
            start_line: 239,
          },
        ],
      },
      note: 'Functions use list[str] and str for file paths instead of Path objects',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'File path parameters should use pathlib.Path instead of str for type safety and cleaner path operations.\nUsing Path types enables method chaining (.parent, .name, .exists()) and avoids manual string concatenation.\nCurrent code mixes str and Path types or unnecessarily converts Path to str.\n',
  should_flag: true,
}
