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
            end_line: 256,
            start_line: 255,
          },
          {
            end_line: 304,
            start_line: 293,
          },
          {
            end_line: 354,
            start_line: 338,
          },
          {
            end_line: 460,
            start_line: 460,
          },
        ],
        'internal/tui/components/chat/messages/tool.go': [
          {
            end_line: 292,
            start_line: 284,
          },
          {
            end_line: 322,
            start_line: 317,
          },
          {
            end_line: 368,
            start_line: 360,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Multiple places in renderer/tool.go build nearly identical parameter display strings (URL, File Path via fsext.PrettyPath, Timeout as seconds->duration). Centralize into shared helpers (e.g., formatParamFilePath, formatParamURL, formatParamTimeout) or a per-tool registry to avoid duplicated formatting logic and ensure consistent presentation across copy-to-clipboard and headers.',
  should_flag: true,
}
