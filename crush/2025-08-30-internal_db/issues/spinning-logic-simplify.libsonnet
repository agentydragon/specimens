{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/tool.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/tool.go': [
          {
            end_line: 1004,
            start_line: 994,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'ToolCallCmp.Spinning currently checks m.spinning, then iterates nested.Spinning and returns true, and finally returns m.spinning. Simplify to early-return on nested.Spining() and then return m.spinning at the end to make the intent clearer.',
  should_flag: true,
}
