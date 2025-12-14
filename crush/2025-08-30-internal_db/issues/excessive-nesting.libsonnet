{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/logging/recover.go',
        ],
      ],
      files: {
        'internal/logging/recover.go': [
          {
            end_line: 24,
            start_line: 11,
          },
        ],
      },
      note: 'RecoverPanic currently wraps its whole body in a recover-check; prefer early-return guard or narrower scope to reduce nesting.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/app/lsp_events.go',
        ],
      ],
      files: {
        'internal/app/lsp_events.go': [
          {
            end_line: 85,
            start_line: 63,
          },
        ],
      },
      note: 'updateLSPState/updateLSPDiagnostics wrap large blocks; prefer early return/guard clauses where applicable.',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/lsp/client.go',
        ],
      ],
      files: {
        'internal/lsp/client.go': [
          {
            end_line: 435,
            start_line: 425,
          },
        ],
      },
      note: 'openKeyConfigFiles: when a file does not exist, use continue to skip rather than nesting the rest of the body.',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'internal/app/app.go',
        ],
      ],
      files: {
        'internal/app/app.go': [
          {
            end_line: 429,
            start_line: 426,
          },
        ],
      },
      note: 'cleanup loop: use continue when cleanup is nil to avoid wrapping body in an extra nesting level.',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'internal/shell/shell.go',
        ],
      ],
      files: {
        'internal/shell/shell.go': [
          {
            end_line: 201,
            start_line: 183,
          },
        ],
      },
      note: 'ArgumentsBlocker: guard with continue when args length is insufficient rather than nesting the matching body.',
      occurrence_id: 'occ-4',
    },
  ],
  rationale: 'Prefer early returns/continues to reduce nesting and make happy-path obvious. Replace large wrapped bodies guarded by a single conditional with small guard-clauses (return/continue) at the top where appropriate.',
  should_flag: true,
}
