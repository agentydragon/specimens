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
            end_line: 105,
            start_line: 104,
          },
          {
            end_line: 139,
            start_line: 134,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Use collections.Counter for tallying exclude-pattern hits.\n\nThe code currently initializes a mapping of exclude pattern -> 0 and increments counts imperatively. Using collections.Counter makes intent clearer, avoids the manual zero-initialization, and expresses that this object is for counting/histogram purposes.\n\nBefore (excerpt):\n\n```python\n# pyright_watch_report.py:\nexclude_hits: dict[str, int] = dict.fromkeys(exclude, 0)\n...\nfor pat in exclude:\n    if matches_any(rp, [pat]):\n        exclude_hits[pat] += 1\n```\n\nAfter (recommended):\n\n```python\nfrom collections import Counter\nexclude_hits = Counter()\n...\nexclude_hits.update(pat for pat in exclude if matches_any(rp, [pat]))\n```\n\nCounter saves the initialization/default-to-zero and documents intent (counts/histogram) succinctly.\n',
  should_flag: true,
}
