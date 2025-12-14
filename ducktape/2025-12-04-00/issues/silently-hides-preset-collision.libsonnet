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
            start_line: 91,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 91 in presets.py silently hides preset name collisions with `if name not in out:`. When the\nsame preset name exists in multiple directories, only the first one is kept and subsequent ones are\nsilently ignored. This makes it unclear which preset is actually loaded and can lead to confusion.\nEither raise an error on collision (strict mode) or remove the conditional and allow later directories\nto overwrite earlier ones (simple precedence).\n',
  should_flag: true,
}
