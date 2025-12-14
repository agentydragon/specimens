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
            end_line: 136,
            start_line: 117,
          },
          {
            end_line: 158,
            start_line: 137,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'makeHeader and makeNestedHeader in internal/tui/components/chat/messages/renderer.go duplicate the same icon selection, tool styling, and prefix construction logic. Consolidate into a shared helper (or a single function with a flag) to remove copy-paste and make future changes less error-prone.',
  should_flag: true,
}
