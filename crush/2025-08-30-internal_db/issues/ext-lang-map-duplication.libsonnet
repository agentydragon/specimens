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
            end_line: 494,
            start_line: 461,
          },
          {
            end_line: 600,
            start_line: 577,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Two near-identical switch statements map file extensions to language names (used for syntax highlighting / clipboard formats) in tool.go. Keep a single mapping table or helper to avoid drift and ensure consistent language naming.',
  should_flag: true,
}
