{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/transcript_handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/transcript_handler.py': [
          {
            end_line: 45,
            start_line: 45,
          },
          {
            end_line: 52,
            start_line: 52,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 45 and 52 use `datetime.utcnow().isoformat() + \"Z\"` for timestamp generation.\n\n`datetime.utcnow()` is deprecated as of Python 3.12 (scheduled for removal in future versions).\nIt returns a timezone-naive datetime, requiring manual \"Z\" suffix concatenation.\n\nReplace with `datetime.now(timezone.utc)` which returns a timezone-aware datetime. The `.isoformat()`\ncall automatically includes timezone offset (e.g., `2024-01-15T10:30:00+00:00`), eliminating the\nmanual suffix. If \"Z\" format is required, use `.replace(\"+00:00\", \"Z\")`.\n\nTimezone-aware datetime provides type safety (datetime knows it's UTC, not just a naive timestamp)\nand prevents accidentally forgetting the timezone suffix or using the wrong timezone.\n",
  should_flag: true,
}
