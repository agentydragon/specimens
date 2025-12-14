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
            end_line: 299,
            start_line: 292,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Prefer Path.write_text for concise dump writing when appropriate.\n\nThe code currently writes out the dumped file with an explicit open + loop which is fine,\nbut when the whole file content can be constructed in memory the `Path.write_text`\nhelper is shorter and clearer.\n\nBefore:\n```python\nwith dump_path.open("w", encoding="utf-8") as f:\n    for p in sorted(kept_union):\n        f.write(str(p) + "\\n")\n```\n\nAfter (shorter):\n```python\ndump_path.write_text("\\n".join(str(p) for p in sorted(kept_union)), encoding="utf-8")\n```\n\nNote: this is appropriate when the dumped content comfortably fits in memory. If the list\ncan be very large (streaming required), keep the streaming form; prefer clarity over micro-optimizations.\n',
  should_flag: true,
}
