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
            start_line: 165,
          },
          {
            end_line: null,
            start_line: 179,
          },
          {
            end_line: null,
            start_line: 196,
          },
          {
            end_line: null,
            start_line: 241,
          },
          {
            end_line: null,
            start_line: 253,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Progress interval is encoded as a magic float literal `1.0` (seconds) in multiple places, which makes the unit implicit.\nEither:\n(A) Preferred: Use a duration type (e.g., `PROGRESS_INTERVAL = timedelta(seconds=1)`) and compare using datetime consistently (e.g., `last_print: datetime`, `now = datetime.now(timezone.utc)`, and `if now - last_print >= PROGRESS_INTERVAL:`).\n(B) At least add _s / _seconds / similar suffix to make unit unambiguous.\n\nOriginal (multiple places):\n```python\nif progress and time.monotonic() - last_print >= 1.0:\n    ...\n    last_print = time.monotonic()\n```\n',
  should_flag: true,
}
