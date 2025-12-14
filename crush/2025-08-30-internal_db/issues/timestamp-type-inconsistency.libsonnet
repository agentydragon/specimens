{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/llm/tools/download.go',
        ],
      ],
      files: {
        'internal/llm/tools/download.go': [
          {
            end_line: 27,
            start_line: 17,
          },
          {
            end_line: 166,
            start_line: 155,
          },
        ],
      },
      note: 'download.go: `Timeout`/`maxTimeout` should be time.Duration or suffixed (timeoutMS)',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/fetch.go',
        ],
      ],
      files: {
        'internal/llm/tools/fetch.go': [
          {
            end_line: 6,
            start_line: 1,
          },
          {
            end_line: 68,
            start_line: 60,
          },
          {
            end_line: 124,
            start_line: 120,
          },
        ],
      },
      note: 'fetch.go: `Timeout int` should be time.Duration',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/tools.go',
        ],
      ],
      files: {
        'internal/llm/tools/tools.go': [
          {
            end_line: 10,
            start_line: 1,
          },
        ],
      },
      note: 'tools.go: `StartedAt`/`UpdatedAt int64` should be time.Time or suffixed (ms epoch)',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'internal/message/content.go',
        ],
      ],
      files: {
        'internal/message/content.go': [
          {
            end_line: 62,
            start_line: 41,
          },
          {
            end_line: 378,
            start_line: 338,
          },
        ],
      },
      note: 'content.go: `{Started,Finished,Created,Updated}At`, `Finish.Time` should be time.Time',
      occurrence_id: 'occ-3',
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
            end_line: 136,
            start_line: 120,
          },
          {
            end_line: 236,
            start_line: 228,
          },
        ],
      },
      note: 'message.go: Watermarks.*TS and Message timestamps should be time.Time (UpdatedAt microseconds)',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'internal/history/file.go',
        ],
      ],
      files: {
        'internal/history/file.go': [
          {
            end_line: 20,
            start_line: 1,
          },
        ],
      },
      note: 'file.go: CreatedAt/UpdatedAt int64 should be time.Time',
      occurrence_id: 'occ-5',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/chat.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/chat.go': [
          {
            end_line: 520,
            start_line: 500,
          },
        ],
      },
      note: 'chat.go: lastUserMessageTime int64 should be time.Time (epoch seconds)',
      occurrence_id: 'occ-6',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 436,
            start_line: 420,
          },
        ],
      },
      note: 'renderer.go: timeout int should be time.Duration (seconds)',
      occurrence_id: 'occ-7',
    },
    {
      expect_caught_from: [
        [
          'internal/pubsub/broker.go',
        ],
      ],
      files: {
        'internal/pubsub/broker.go': [
          {
            end_line: 58,
            start_line: 50,
          },
          {
            end_line: 172,
            start_line: 160,
          },
        ],
      },
      note: 'broker.go: now := time.Now().UnixMilli() should use time.Time directly',
      occurrence_id: 'occ-8',
    },
    {
      expect_caught_from: [
        [
          'internal/session/session.go',
        ],
      ],
      files: {
        'internal/session/session.go': [
          {
            end_line: 23,
            start_line: 21,
          },
          {
            end_line: 146,
            start_line: 140,
          },
        ],
      },
      note: 'session.go: CreatedAt/UpdatedAt int64 should be time.Time',
      occurrence_id: 'occ-9',
    },
    {
      expect_caught_from: [
        [
          'internal/transform/transform.go',
        ],
      ],
      files: {
        'internal/transform/transform.go': [
          {
            end_line: 38,
            start_line: 34,
          },
        ],
      },
      note: 'transform.go: CreatedAt int64 should be time.Time',
      occurrence_id: 'occ-10',
    },
  ],
  rationale: 'Use `time.Time` for timestamps, `time.Duration` for timeouts/durations (avoid bare ints; if you must use int, suffix units in names).\n',
  should_flag: true,
}
