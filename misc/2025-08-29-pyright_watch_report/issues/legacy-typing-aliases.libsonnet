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
            start_line: 30,
          },
          {
            end_line: null,
            start_line: 36,
          },
          {
            end_line: null,
            start_line: 90,
          },
          {
            end_line: null,
            start_line: 192,
          },
          {
            end_line: null,
            start_line: 198,
          },
          {
            end_line: null,
            start_line: 211,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Code uses legacy `typing` aliases (`List`/`Dict`/`Set`/`Tuple`).\nSwitch to modern built‑in generics (`list`/`dict`/`set`/`tuple`) and using `collections.abc` for protocols like `Iterable`, to keep types concise and idiomatic.\n',
  should_flag: true,
}
