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
            start_line: 50,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '`dump_path` type annotation is misleading - it types it as `Path | None`, but the rhs is never `None`:\n\n```python\ndump_path: Path | None = Path(args.dump).resolve() if args.dump else (root / "scratch/pyright_watched_files.txt")\n```\n\nAnnotate as `Path` (not `Path | None`).\n',
  should_flag: true,
}
