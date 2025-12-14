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
            end_line: 226,
            start_line: 222,
          },
          {
            end_line: 266,
            start_line: 262,
          },
          {
            end_line: 301,
            start_line: 298,
          },
          {
            end_line: 350,
            start_line: 346,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Multiple renderers (bash/view/edit/multiedit) repeat the same pattern: attempt to unmarshal v.result.Metadata into a tool-specific metadata struct and, on error, fall back to rendering plain content. Centralize this into a small helper (e.g., tryUnmarshalMeta(v, &meta) (ok bool)) to avoid duplication and drift.',
  should_flag: true,
}
