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
            end_line: null,
            start_line: 114,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 114 in presets.py hides errors when requesting an unknown preset name:\n`preset = presets.get(preset_name or \"default\") or presets[\"default\"]`. This fallback chain silently\nreturns the default preset if the requested name doesn't exist, making typos or missing presets hard\nto detect. The function should raise a KeyError when an unknown preset is requested. The signature\nshould default `preset_name` to \"default\" (`preset_name: str = \"default\"`), then directly access\n`presets[preset_name]` without catching KeyError.\n",
  should_flag: true,
}
