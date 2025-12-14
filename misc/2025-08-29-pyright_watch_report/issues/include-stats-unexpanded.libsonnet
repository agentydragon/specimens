{
  occurrences: [
    {
      expect_caught_from: [
        [
          'pyright_watch_report.py',
        ],
      ],
      files: {
        'pyright_watch_report.py': [
          {
            end_line: 76,
            start_line: 60,
          },
          {
            end_line: 105,
            start_line: 96,
          },
          {
            end_line: 245,
            start_line: 227,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Per-include stats are computed against the original, unexpanded include patterns, while the\nscan itself expands plain directory includes. This causes counts to be wrong (or zero) for\nincludes like "src" that expand to "src/**" during the scan but are later matched literally as\n"src" when computing per-include kept/unique.\n\nWhere:\n- expand_include_patterns (lines 60–75) turns:\n  - "." → "**/*"\n  - "src" → "src/**"\n  - "src/" → "src/**"\n  - Any pattern with glob metachar (* ? [) → unchanged\n- gather_files_single_pass uses the expanded include set for the walk (lines ~100–105).\n- per-include kept/unique stats (lines 227–245) iterate the original include list and call\n  matches_any(rel(p, root), [pat]) with the unexpanded pattern.\n\nIllustrated example:\n- include = ["src", "tests/**/*.py"]\n- expand_include_patterns(include) = ["src/**", "tests/**/*.py"]  # used for traversal\n- kept_union contains files like "src/pkg/a.py"\n- per-include kept phase uses the original "src" (not "src/**"), so fnmatch("src/pkg/a.py", "src") = false\n  → the kept/unique counts for "src" are under-reported.\n\nAcceptance criteria:\n- Compute per-include kept and per-include unique against the expanded include set (same rules used\n  by the traversal), while preserving the original labels for display.\n  For example, precompute:\n    expanded = expand_include_patterns(include)\n    label_map = { original: expanded_i }\n  then use label_map[original] for matches_any in both the kept and unique computations, but print\n  "original" in output tables.\n- Keep normalize_pattern behavior consistent across both phases.\n',
  should_flag: true,
}
