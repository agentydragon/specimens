{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/tool.go',
        ],
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 220,
            start_line: 218,
          },
        ],
        'internal/tui/components/chat/messages/tool.go': [
          {
            end_line: 280,
            start_line: 276,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Both tool.go and renderer.go perform identical sanitization of Bash command strings (replace "\n" with space and tabs with 4 spaces). Factor into a shared helper (e.g., sanitizeInlineCommand) to avoid duplicated logic and ensure consistent sanitization across UI renderers and copy-to-clipboard output.',
  should_flag: true,
}
