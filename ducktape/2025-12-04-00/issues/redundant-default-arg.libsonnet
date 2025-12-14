{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: 140,
            start_line: 139,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Function _abort_result has parameter with default value that is immediately replaced with another default in the function body. The DEFAULT_ABORT_ERROR constant should simply be the parameter default, eliminating the redundant `or` expression.\n\nCurrent pattern: `def _abort_result(reason: str | None = None) -> ...: return _make_error_result(reason or DEFAULT_ABORT_ERROR)`\n\nShould be: `def _abort_result(reason: str = DEFAULT_ABORT_ERROR) -> ...: return _make_error_result(reason)`\n',
  should_flag: true,
}
