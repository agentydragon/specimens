local I = import 'lib.libsonnet';

I.issueMulti(
  rationale=|||
    The function `_filter_files` is duplicated nearly identically in two CLI command files. Both implementations:
    - Take the same parameters: `all_files: Mapping[Path, object], requested_files: list[str] | None`
    - Return the same type: `FileScopeSpec`
    - Have identical logic for validation and filtering
    - Only differ in one docstring word: "specimen" vs "snapshot"

    This 20+ line function should be extracted to a shared CLI utilities module (e.g., `adgn/src/adgn/props/cli_app/shared.py` or similar) and imported in both command files.
  |||,
  occurrences=[
    {
      files: {
        'adgn/src/adgn/props/cli_app/cmd_detector.py': [[252, 275]],
      },
      note: 'First copy in cmd_detector.py with "specimen" in docstring',
      expect_caught_from: [['adgn/src/adgn/props/cli_app/cmd_detector.py']],
    },
    {
      files: {
        'adgn/src/adgn/props/cli_app/main.py': [[171, 194]],
      },
      note: 'Second copy in main.py with "snapshot" in docstring',
      expect_caught_from: [['adgn/src/adgn/props/cli_app/main.py']],
    },
  ]
)
