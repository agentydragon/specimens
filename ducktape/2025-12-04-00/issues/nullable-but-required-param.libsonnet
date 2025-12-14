{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/cmd_detector.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/cmd_detector.py': [
          {
            end_line: 301,
            start_line: 293,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 293-301 type the snapshot parameter as nullable (`specimen_str: str | None`)\nbut immediately check for None and exit with an error. This is a misleading type\nsignature that should be replaced with a required parameter, and checking for presence\nshould be left up to Typer.\n',
  should_flag: true,
}
