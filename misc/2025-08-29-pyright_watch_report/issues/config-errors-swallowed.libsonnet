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
            end_line: 51,
            start_line: 46,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 46-51 silently swallow config read/parse errors in `load_config`. The function\niterates candidate config files and uses `try/except Exception: pass` to skip any that\nfail to read or parse, continuing to the next candidate.\n\nProblems: silently discards explicit user intent when `--config` is provided, hides real\nconfiguration errors, broken files indicate issues users should see.\n\nFix: let exceptions propagate (fail-fast) or catch and re-raise with context. Do not\nsilently continue to the next candidate.\n',
  should_flag: true,
}
