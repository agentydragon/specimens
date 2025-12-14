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
            end_line: 244,
            start_line: 232,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Use comprehension + seen-update pattern for per-include unique counts to make the code shorter and less nested while remaining readable and correct.\n\nBefore:\n\n```python\nseen: Set[Path] = set()\nper_include_unique: List[Tuple[str, int]] = []\nfor pat in include:\n    uniq_count = 0\n    for p in sorted(kept_union):\n        if p in seen:\n            continue\n        if matches_any(rel(p, root), [pat]):\n            uniq_count += 1\n            seen.add(p)\n    per_include_unique.append((pat, uniq_count))\n```\n\nAfter (shorter/flattened):\n\n```python\nper_include_unique: dict[str, set[Path]] = {}\nseen: set[Path] = set()\nfor pat in include:\n    paths = {p for p in sorted(kept_union) if p not in seen and matches_any(rel(p, root), [pat])}\n    per_include_unique[pat] = paths\n    seen.update(paths)\n```\n\nThis primarily reduces nesting and temporary counters while keeping the same semantics.\n',
  should_flag: true,
}
