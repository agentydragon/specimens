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
            end_line: 275,
            start_line: 252,
          },
        ],
      },
      note: 'First copy in cmd_detector.py with "specimen" in docstring',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/main.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/main.py': [
          {
            end_line: 194,
            start_line: 171,
          },
        ],
      },
      note: 'Second copy in main.py with "snapshot" in docstring',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'The function `_filter_files` is duplicated nearly identically in two CLI command files. Both implementations:\n- Take the same parameters: `all_files: Mapping[Path, object], requested_files: list[str] | None`\n- Return the same type: `FileScopeSpec`\n- Have identical logic for validation and filtering\n- Only differ in one docstring word: "specimen" vs "snapshot"\n\nThis 20+ line function should be extracted to a shared CLI utilities module (e.g., `adgn/src/adgn/props/cli_app/shared.py` or similar) and imported in both command files.\n',
  should_flag: true,
}
