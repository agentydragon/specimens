{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/notifications/buffer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/notifications/buffer.py': [
          {
            end_line: 72,
            start_line: 62,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 62-72 define `poll()` and `peek()` which both call `_build_resources()` and\ncreate `NotificationsBatch` objects independently. This duplicates the batch creation\nlogic.\n\n**The issue:** Both methods build resources and construct batch objects separately,\nobscuring that `poll()` is conceptually `peek()` plus clear operations.\n\n**Fix:** Make `poll()` call `peek()`, then clear buffers. This DRYs batch creation\ninto one place and makes the relationship explicit: poll = peek + clear.\n\nIf `_build_resources()` becomes single-use after this change, inline it into `peek()`.\n',
  should_flag: true,
}
