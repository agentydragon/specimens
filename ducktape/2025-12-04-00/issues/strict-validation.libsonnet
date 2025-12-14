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
            end_line: 276,
            start_line: 274,
          },
        ],
      },
      note: 'Silent continue for component != "system_prompt" should assert that components_to_update contains only "system_prompt"',
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
            end_line: 221,
            start_line: 220,
          },
        ],
      },
      note: 'yaml.safe_load() fallback "or {}" suppresses None result which should be an error',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Silent ignoring of invalid configuration should be replaced with explicit validation.\nWhen receiving structured inputs, code should assert expected values rather than\nsilently skipping unknown options. This catches configuration errors early.\n',
  should_flag: true,
}
