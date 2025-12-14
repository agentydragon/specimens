{
  occurrences: [
    {
      expect_caught_from: [
        [
          'pyright_watch_report.py',
        ],
      ],
      files: {
        'pyright_watch_report.py': [
          {
            end_line: 262,
            start_line: 259,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Condense and de-duplicate config printing.\n\nThe code prints the config path with an if/else that can be expressed more concisely without losing clarity. A single expression using `or` is shorter and avoids branching noise.\n\nBefore:\n```python\nif cfg_file:\n    print(f\"config: {cfg_file}\")\nelse:\n    print(\"config: <not found, using defaults>\")\n```\n\nAfter (shorter):\n```python\nprint(f\"config: {cfg_file or '<not found, using defaults>'}\")\n```\n\nThis is a readability-focused micro-refactor: it reduces branching for a simple, readable output and keeps intent clear.\n",
  should_flag: true,
}
