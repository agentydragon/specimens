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
  rationale: 'Repeated periodic progress-logging block.\n\nThe same 3-line progress-logging snippet is duplicated in four places inside\ngather_files_single_pass. Extract a small helper to reduce duplication,\nmake intent obvious, and avoid copy/paste drift.\n\nBefore (examples taken verbatim from the specimen):\n\n```python\nif progress and time.monotonic() - last_print >= 1.0:\n    sys.stderr.write(\n        f"scan dirs={scanned_dirs} files={scanned_files} kept={len(kept_union)} at {rp}\\n",\n    )\n    sys.stderr.flush()\n    last_print = time.monotonic()\n```\n\nThis is repeated at least 4 times.\n\nAfter (extract a helper):\n\n```python\ndef maybe_log_progress() -> None:\n    nonlocal last_print\n    if progress and time.monotonic() - last_print >= 1.0:\n        sys.stderr.write(\n            f"scan dirs={scanned_dirs} files={scanned_files} kept={len(kept_union)} at {rp}\\n",\n        )\n        sys.stderr.flush()\n        last_print = time.monotonic()\n\n# Then in the code:\nmaybe_log_progress()\n```\n\nThis makes intent clear and reduces duplication.\n',
  should_flag: true,
}
