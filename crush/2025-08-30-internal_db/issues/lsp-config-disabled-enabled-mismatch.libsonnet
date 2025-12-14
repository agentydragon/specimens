{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/config/config.go',
        ],
      ],
      files: {
        'internal/config/config.go': [
          {
            end_line: 127,
            start_line: 127,
          },
        ],
        'internal/tui/components/lsp/lsp.go': [
          {
            end_line: 63,
            start_line: 63,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'LSPConfig.Disabled field has inverted JSON serialization: the Go field is named `Disabled` but serializes as `"enabled"` in JSON.\n\nField definition at internal/config/config.go:127:\n- Go field name: `Disabled bool`\n- JSON tag: `json:"enabled,omitempty"`\n- Schema description: "Whether this LSP server is disabled"\n\nThis creates confusing inverted logic:\n- Setting `{"enabled": true}` in config JSON sets `Disabled = true` in Go (backwards!)\n- Setting `{"enabled": false}` in config JSON sets `Disabled = false` in Go (backwards!)\n\nThe Go code uses `.Disabled` correctly (e.g., internal/tui/components/lsp/lsp.go:63 checks `if l.LSP.Disabled`), so the JSON tag is wrong.\n\nFix: Change JSON tag to `json:"disabled,omitempty"` to match the field name and schema description, or rename the Go field to `Enabled` and update the schema description to match.\n\nThis appears to be an incomplete refactoring where the field was partially renamed from one polarity to the other.\n',
  should_flag: true,
}
