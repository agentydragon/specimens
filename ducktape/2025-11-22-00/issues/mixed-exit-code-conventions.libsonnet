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
            end_line: 556,
            start_line: 551,
          },
          {
            end_line: 564,
            start_line: 558,
          },
          {
            end_line: 609,
            start_line: 567,
          },
          {
            end_line: 732,
            start_line: 728,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Functions inconsistently mix two conventions for signaling exit codes: some declare\n`-> int` return types but actually raise `ExitWithCode` exceptions on error paths.\n\n**Evidence:**\n- `_commit_immediately` (lines 558-564): declared `-> int`, but raises `ExitWithCode(1)` on some paths\n- `_run_editor_flow` (lines 567-609): declared `-> int`, but has 7 paths that raise `ExitWithCode`\n- Callers (lines 728-732): expect int return, but `sys.exit(code)` is unreachable when exception raised\n\n**Problems:**\n1. Type lies: functions promise `-> int` but raise exceptions, violating contracts\n2. Unreachable code: code after exception-raising calls never executes\n3. Easy to forget: callers must remember BOTH to check returns AND catch exceptions\n4. No guidance: new code has no clear pattern to follow\n\n**Fix:** Pick ONE convention consistently. Option A (always raise exceptions, change\nsignatures to `-> None`): impossible to forget, clear failure paths, consistent with\nPython's `SystemExit`. Option B (always return int): never raise, always return codes.\nMixing both violates type contracts and creates ad-hoc error handling.\n",
  should_flag: true,
}
