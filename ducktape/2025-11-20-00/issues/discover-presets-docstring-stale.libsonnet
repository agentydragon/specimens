{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/presets.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/presets.py': [
          {
            end_line: 63,
            start_line: 60,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "discover_presets docstring (lines 60-63) references DEFAULT_PRESETS_DIRS, but this constant\ndoesn't exist anywhere in the code - the implementation only checks env_dir and\n_xdg_presets_dir() (lines 66-70). The docstring is misleading about the actual search order\nand available configuration.\n",
  should_flag: true,
}
