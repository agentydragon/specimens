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
            end_line: 301,
            start_line: 292,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Final dump error handling should not swallow exceptions.\n\nThe end-of-program dump currently catches Exception, prints a short warning, and allows the program to exit 0. This hides real failures (permission errors, full disk, etc.) and removes useful stack traces.\n\nBefore (pyright_watch_report.py lines ~292–301):\n\n```python\ntry:\n    dump_path.parent.mkdir(parents=True, exist_ok=True)\n    with dump_path.open("w", encoding="utf-8") as f:\n        for p in sorted(kept_union):\n            f.write(str(p) + "\\n")\n    sys.stderr.write(f"Written {len(kept_union)} paths to {dump_path}\\n")\nexcept Exception as e:\n    sys.stderr.write(f"Warning: failed to write dump: {e}\\n")\n```\n\nAfter (recommended): Let exceptions propagate so failures are visible:\n\n```python\ndump_path.parent.mkdir(parents=True, exist_ok=True)\nwith dump_path.open("w", encoding="utf-8") as f:\n    for p in sorted(kept_union):\n        f.write(str(p) + "\\n")\nsys.stderr.write(f"Written {len(kept_union)} paths to {dump_path}\\n")\n```\n\nThis makes real problems visible and avoids silent data loss.\n',
  should_flag: true,
}
