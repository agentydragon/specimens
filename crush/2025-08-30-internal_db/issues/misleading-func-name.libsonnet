{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/renderer.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/renderer.go': [
          {
            end_line: 434,
            start_line: 424,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Misleading name/doc: `getFileExtension` returns synthesized file names (fake paths), not an extension; rename and update doc to reflect actual return value.',
  should_flag: true,
}
