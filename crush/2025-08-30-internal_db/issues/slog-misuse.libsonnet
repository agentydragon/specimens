{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/db/connect.go',
        ],
        [
          'internal/app/lsp.go',
        ],
      ],
      files: {
        'internal/app/lsp.go': [
          {
            end_line: 31,
            start_line: 31,
          },
        ],
        'internal/db/connect.go': [
          {
            end_line: 48,
            start_line: 48,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'slog calls with positional arguments instead of structured key-value pairs.\n\nslog requires alternating string keys and values after the message: slog.Error(msg, "key1", val1, "key2", val2).\n\nIncorrect usage passes raw variables without key strings:\n- internal/db/connect.go:48: slog.Error("Failed to set pragma", pragma, err)\n- internal/app/lsp.go:31: slog.Error("Failed to create LSP client for", name, err)\n\nShould be:\n- slog.Error("Failed to set pragma", "pragma", pragma, "error", err)\n- slog.Error("Failed to create LSP client", "name", name, "error", err)\n\nThis breaks structured logging output and makes log parsing/filtering difficult.\n',
  should_flag: true,
}
