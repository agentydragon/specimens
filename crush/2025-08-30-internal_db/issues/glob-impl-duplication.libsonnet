{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/lsp/watcher/watcher.go',
        ],
        [
          'internal/fsext/fileutil.go',
        ],
      ],
      files: {
        'internal/fsext/fileutil.go': [
          {
            end_line: 196,
            start_line: 1,
          },
        ],
        'internal/lsp/watcher/watcher.go': [
          {
            end_line: 672,
            start_line: 583,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Codebase contains two different glob implementations: watcher.go implements custom matchesGlob/matchesSimpleGlob while internal/fsext/fileutil.go uses doublestar.Match. Standardize on a single, well-documented implementation (prefer doublestar if it covers required semantics) or wrap matching behind a small helper API so semantics are explicit and maintained in one place.',
  should_flag: true,
}
