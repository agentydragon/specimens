{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/diff/word_inline.go',
        ],
      ],
      files: {
        'internal/diff/word_inline.go': [
          {
            end_line: 44,
            start_line: 43,
          },
        ],
      },
      note: 'dir + "/old", dir + "/new" → filepath.Join(dir, "old"), filepath.Join(dir, "new")',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/cmd/root.go',
        ],
      ],
      files: {
        'internal/cmd/root.go': [
          {
            end_line: 147,
            start_line: 147,
          },
          {
            end_line: 151,
            start_line: 151,
          },
          {
            end_line: 152,
            start_line: 152,
          },
        ],
      },
      note: 'dataDir + "/logs/..." → filepath.Join(dataDir, "logs", ...)',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'e2e/scenario_live_basic_test.go',
        ],
      ],
      files: {
        'e2e/scenario_live_basic_test.go': [
          {
            end_line: 44,
            start_line: 44,
          },
        ],
      },
      note: 'sc.ArtifactDir + "/logs/provider-wire.log" → filepath.Join(sc.ArtifactDir, "logs", "provider-wire.log")',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'internal/config/provider_empty_test.go',
        ],
      ],
      files: {
        'internal/config/provider_empty_test.go': [
          {
            end_line: 20,
            start_line: 20,
          },
          {
            end_line: 33,
            start_line: 33,
          },
        ],
      },
      note: 't.TempDir() + "/providers.json" → filepath.Join(t.TempDir(), "providers.json")',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'internal/config/provider_test.go',
        ],
      ],
      files: {
        'internal/config/provider_test.go': [
          {
            end_line: 30,
            start_line: 30,
          },
          {
            end_line: 44,
            start_line: 44,
          },
          {
            end_line: 69,
            start_line: 69,
          },
        ],
      },
      note: 't.TempDir() + "/providers.json" → filepath.Join(t.TempDir(), "providers.json")',
      occurrence_id: 'occ-4',
    },
  ],
  rationale: 'Filesystem paths constructed via string concatenation instead of filepath.Join.\n\nString concatenation with "/" hardcodes Unix path separators and fails on Windows (backslash separators). filepath.Join handles OS-specific separators and cleans redundant slashes.\n\nImpact: Code fails on Windows; non-portable and non-idiomatic.\n',
  should_flag: true,
}
