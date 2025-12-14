{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/scripts/generate_frontend_code.py',
        ],
      ],
      files: {
        'adgn/scripts/generate_frontend_code.py': [
          {
            end_line: 53,
            start_line: 52,
          },
          {
            end_line: 174,
            start_line: 174,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The code uses `open()` with manual read when `Path.read_text()` is cleaner and more idiomatic.\n\n**Current code (lines 52-53):**\n```python\nwith open(python_file) as f:\n    code = f.read()\n```\n\n**Should be:**\n```python\ncode = python_file.read_text()\n```\n\n**Why Path.read_text() is better:**\n- `python_file` is already a `Path` object (line 47 signature shows `Path`)\n- `Path.read_text()` handles encoding automatically (defaults to locale encoding)\n- More concise - one line instead of two\n- Consistent with line 174 which already uses `output_file.write_text(ts_code)`\n- No need for manual context manager\n- More idiomatic modern Python\n\n**Context preservation:**\nThe current code executes the file with `exec(code, namespace)` at line 54, so the code\nstring is still needed. This is not about removing the intermediate variable, just using\nthe cleaner Path API.\n',
  should_flag: true,
}
