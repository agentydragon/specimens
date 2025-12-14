{
  occurrences: [
    {
      files: {
        'internal/cmd/root.go': [
          {
            end_line: 31,
            start_line: 29,
          },
          {
            end_line: 169,
            start_line: 132,
          },
        ],
      },
      relevant_files: [
        'internal/cmd/root.go',
      ],
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'A past critique suggested renaming the CLI flag `--yolo` (and local variable `yolo`) to a more\ndescriptive predicate such as `--skip-permission-requests`. This is a false positive.\n\n"yolo mode" is intentionally branded and used consistently across the user-facing docs and UX\nas a short, memorable alias for the dangerous mode that automatically accepts permission requests.\nThe flag help already documents its semantics clearly: "Automatically accept all permissions (dangerous mode)".\n\nIt is acceptable to keep the public flag name `--yolo` as a tongue-in-cheek user-facing label while\nkeeping any internal semantic name (e.g., skip-permissions) in code where helpful. No change required.\n',
  should_flag: false,
}
