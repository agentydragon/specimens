{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/csync/maps.go',
        ],
      ],
      files: {
        'internal/csync/maps.go': [
          {
            end_line: 114,
            start_line: 111,
          },
        ],
      },
      note: 'JSONSchemaAlias returns a throwaway temp map `m` — inline the literal return value.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/format/spinner.go',
        ],
      ],
      files: {
        'internal/format/spinner.go': [
          {
            end_line: 69,
            start_line: 44,
          },
        ],
      },
      note: 'NewSpinner builds a local `model` and `prog` only used once to construct Spinner — inline into the returned struct where sensible.',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/session/session.go',
        ],
      ],
      files: {
        'internal/session/session.go': [
          {
            end_line: 156,
            start_line: 150,
          },
        ],
      },
      note: 'NewService creates a one-off `broker` local and then returns a struct containing it — inline into the struct literal.',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'internal/config/provider.go',
        ],
      ],
      files: {
        'internal/config/provider.go': [
          {
            end_line: 85,
            start_line: 82,
          },
        ],
      },
      note: 'Providers(): inline one-off locals `client := catwalk.NewWithURL(...)` and `path := providerCacheFileData()` into the call site or helper to reduce noise.',
      occurrence_id: 'occ-3',
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
            end_line: 576,
            start_line: 568,
          },
        ],
      },
      note: 'isPathWatched: `isMatch` is assigned then returned immediately; return expression directly or inline the match check.',
      occurrence_id: 'occ-4',
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
            end_line: 672,
            start_line: 653,
          },
        ],
      },
      note: 'matchesSimpleGlob: several single-use `isMatch` temporaries in the ** handling branch can be inlined into their return expressions.',
      occurrence_id: 'occ-5',
    },
  ],
  rationale: 'Inline single-use temporaries and trivial wrapper locals (prefer struct literals or direct expressions) to reduce noise and make intent clearer.\n',
  should_flag: true,
}
