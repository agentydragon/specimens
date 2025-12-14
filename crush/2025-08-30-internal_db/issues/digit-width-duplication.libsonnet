{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/llm/tools/view.go',
        ],
      ],
      files: {
        'internal/llm/tools/view.go': [
          {
            end_line: 276,
            start_line: 258,
          },
        ],
      },
      note: 'addLineNumbers uses fixed 6-char padding via fmt.Sprintf("%6s", numStr). Consider Digits helper and minimal adaptation.',
      occurrence_id: 'occ-0',
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
            end_line: 883,
            start_line: 817,
          },
        ],
      },
      note: 'renderCodeContent uses getDigits dynamic digit counting; keep rendering behavior separate for UI but extract shared Digits helper.',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Duplicate digit-width logic exists: view.addLineNumbers uses a fixed 6-character width; renderer.renderCodeContent computes digits via getDigits. Extract a shared Digits helper in internal/format/lineno while keeping rendering differences (LLM vs human) separate.',
  should_flag: true,
}
