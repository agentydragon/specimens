{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/message/middleware/debounce.go',
        ],
      ],
      files: {
        'internal/message/middleware/debounce.go': [
          {
            end_line: 41,
            start_line: 33,
          },
          {
            end_line: 105,
            start_line: 94,
          },
        ],
      },
      note: 'debounce.getOrCreate/deleteEntry/Delete use `id string` where this represents message IDs — rename to messageID.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/message/middleware/serialized.go',
        ],
      ],
      files: {
        'internal/message/middleware/serialized.go': [
          {
            end_line: 36,
            start_line: 27,
          },
          {
            end_line: 141,
            start_line: 134,
          },
          {
            end_line: 152,
            start_line: 134,
          },
        ],
      },
      note: 'sessionWorker.id / newSessionWorker(id) / Delete(ctx,id) opaque `id` represents sessionID or messageID in different contexts — make names explicit.',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/message/message.go',
        ],
      ],
      files: {
        'internal/message/message.go': [
          {
            end_line: 72,
            start_line: 61,
          },
          {
            end_line: 246,
            start_line: 239,
          },
        ],
      },
      note: 'Service.Delete(ctx, id string) and other interfaces use `id` param name — prefer messageID for clarity across API boundaries.',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Function parameters named generically `id` are ambiguous; prefer explicit names like `messageID` or `sessionID` to make intent/units obvious and avoid accidental misuses.',
  should_flag: true,
}
