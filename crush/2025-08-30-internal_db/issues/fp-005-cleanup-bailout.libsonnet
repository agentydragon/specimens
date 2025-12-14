{
  occurrences: [
    {
      files: {
        'internal/app/app.go': [
          {
            end_line: 206,
            start_line: 200,
          },
        ],
      },
      relevant_files: [
        'internal/app/app.go',
      ],
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'A reviewer suggested refactoring the cleanup loop in internal/app/app.go from:\n\n  for _, cleanup := range app.cleanupFuncs {\n      if cleanup != nil {\n          cleanup()\n      }\n  }\n\nto an early-bailout style using `continue` when cleanup == nil. This is a false positive. The\nexisting form is brief and clear; rewriting to use `continue` yields no measurable improvement and\nis not necessary. Keep as-is.\n',
  should_flag: false,
}
