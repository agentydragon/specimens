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
            end_line: null,
            start_line: 218,
          },
          {
            end_line: null,
            start_line: 236,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Account include and exclude pattern hits symmetrically: accumulate include stats inside the main walk instead of reconstructing later.\nThis avoids a second pass and keeps ordering semantics obvious.\n\nSpecimen's post-hoc reconstruction of include hits from `kept_union`:\n\n```python\nper_include_kept: Dict[str, int] = {}\nfor pat in include:\n  per_include_kept[pat] = sum(1 for p in kept_union if matches_any(rel(p, root), [pat]))\n# and a separate loop to compute \"unique additional\" with a seen set\n```\n\nBetter (gather hits during the scan):\n\n```python\ninclude_hits = Counter()                 # all includes that match a file\nper_include_unique: dict[str, set[Path]] = {pat: set() for pat in include}\nseen: set[Path] = set()\n...\n# Inside the os.walk loop, after rp = rel(p, root)\nmatches = [pat for pat in include if matches_any(rp, [pat])]\ninclude_hits.update(matches)\n# First-match wins for order-sensitive \"unique additional\" counting\nfor pat in matches:\n  if p not in seen:\n      per_include_unique[pat].add(p)\n      seen.add(p)\n  break\n```\n\nThis reduces moving parts and cognitive load needed do understand the pipeline.\n",
  should_flag: true,
}
