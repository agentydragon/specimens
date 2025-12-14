{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/diff/external.go',
        ],
      ],
      files: {
        'internal/diff/external.go': [
          {
            end_line: 43,
            start_line: 41,
          },
          {
            end_line: 93,
            start_line: 92,
          },
        ],
      },
      note: 'Example: Diff.ExternalCommand / ParseMode guarded by multi-level nil checks; centralize via config.Diff().ParseMode or a nil-safe helper.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/lsp/watcher/watcher.go',
        ],
      ],
      files: {
        'internal/lsp/watcher/watcher.go': [
          {
            end_line: 356,
            start_line: 320,
          },
        ],
      },
      note: 'Numerous checks for cfg.Options.DebugLSP and config-derived guards; prefer config.DebugLSP()/config.CurrentLSPIgnore() helpers or DI.',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/tools.go',
        ],
      ],
      files: {
        'internal/llm/tools/tools.go': [
          {
            end_line: 30,
            start_line: 1,
          },
        ],
      },
      note: 'Representative site for reading GrepTimeoutSecs, BashBlockedCommands, MaxToolOutputBytes — prefer config.GrepTimeoutSecs(), config.BashBlockedCommands() helpers or DI.',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Call-sites frequently chain nil checks (cfg != nil && cfg.Options != nil && cfg.Options.X != nil ...) which is noisy and error-prone. Centralize nil-safe accessors on Config (nil-receiver-safe methods) or pass *config.Config by DI to eliminate repetitive pointer chains and consolidate defaults.',
  should_flag: true,
}
