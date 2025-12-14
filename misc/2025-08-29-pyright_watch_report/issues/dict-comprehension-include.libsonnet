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
            end_line: 231,
            start_line: 228,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Use a dict comprehension for per_include_kept to reduce ephemeral state and make intent clear.\n\nBefore (pyright_watch_report.py original):\n\n```python\nper_include_kept: Dict[str, int] = {}\nfor pat in include:\n    per_include_kept[pat] = sum(1 for p in kept_union if matches_any(rel(p, root), [pat]))\n```\n\nAfter (preferred):\n\n```python\nper_include_kept: dict[str, int] = {\n    pat: sum(1 for p in kept_union if matches_any(rel(p, root), [pat]))\n    for pat in include\n}\n```\n\nThis is clearer, fewer moving parts, and avoids an imperative accumulation pattern.\n',
  should_flag: true,
}
