{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/prompt_optimizer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/prompt_optimizer.py': [
          {
            end_line: 364,
            start_line: 360,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 360-364 build a dictionary using imperative append-style code (initialize\nempty dict, then loop with assignment). This pattern should use a dict comprehension\nfor clarity and conciseness:\n\nCurrent:\n  extra_volumes = {}\n  for slug, path in train_specimens.items():\n      extra_volumes[str(path.resolve())] = {"bind": f"/snapshots/train/{slug}", "mode": "ro"}\n\nPreferred:\n  extra_volumes = {\n      str(path.resolve()): {"bind": f"/snapshots/train/{slug}", "mode": "ro"}\n      for slug, path in train_specimens.items()\n  }\n\nDict comprehensions are more idiomatic Python for building dictionaries from\niterations, reduce line count, and make the intent clearer.\n',
  should_flag: true,
}
