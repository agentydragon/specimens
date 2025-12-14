{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 215,
            start_line: 215,
          },
        ],
      },
      note: 'Unnecessary return after try/except/finally in if branch',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 218,
            start_line: 218,
          },
        ],
      },
      note: 'Unnecessary return at end of method',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'The `_run_impl` method has a return type of `-> None` and contains two explicit `return` statements that should be removed:\n\n**Line 215**: Plain `return` after the try/except/finally block. Since the function returns `None`, this explicit return is unnecessary - the function will implicitly return None when it reaches the end.\n\n**Line 218**: Plain `return` at the very end of the method after the error logging. This is redundant since Python functions implicitly return None at the end.\n\nUnnecessary return statements add visual noise without providing value. In functions that return `None`, only early returns (to exit the function before reaching the end) are meaningful.\n',
  should_flag: true,
}
