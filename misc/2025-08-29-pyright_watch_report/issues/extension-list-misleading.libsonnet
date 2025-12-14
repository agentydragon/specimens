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
            start_line: 36,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Extension list is misleading and duplicated.\nPrinted list is hard-coded `.py/.pyi/.pyx` which does not match `CODE_EXTS` (set to `{'.py', '.pyi'}`).\n\n```python\nprint(f\"  of which code (.py/.pyi/.pyx): {total_code}\")\n```\n\nDerive from one source of truth - `CODE_EXTS` - instead:\n\n```python\nprint(f\"  of which code ({'/'.join(sorted(CODE_EXTS))}): {total_code}\")\n```\n\nThis makes the message not misleading and avoids future drift.\n",
  should_flag: true,
}
