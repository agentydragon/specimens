{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 568,
            start_line: 560,
          },
          {
            end_line: 784,
            start_line: 781,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 560-568 define `ExitWithCode` exception for signaling exit codes. Python\nalready has `SystemExit` built-in which serves exactly this purpose.\n\n**Current:**\n```python\nclass ExitWithCode(Exception):\n    def __init__(self, code: int):\n        super().__init__(str(code))\n        self.code = code\n\nraise ExitWithCode(128)\n# Later caught: except ExitWithCode as e: sys.exit(e.code)\n```\n\n**Standard approach:**\n```python\nraise SystemExit(128)\n# SystemExit automatically exits with the code; no catch needed\n```\n\n**Fix:**\n- Delete `ExitWithCode` class definition\n- Replace all `raise ExitWithCode(N)` with `raise SystemExit(N)`\n- Remove the `except ExitWithCode` handler in `main()` - SystemExit exits automatically\n',
  should_flag: true,
}
