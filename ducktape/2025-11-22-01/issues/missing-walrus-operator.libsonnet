{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 96,
            start_line: 95,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 95-96 in `await_decision` use a two-line pattern: get a value, check if None.\nThe walrus operator provides a cleaner one-line solution for this exact pattern.\n\nCurrent: `pending = self._pending.get(call_id)` then `if pending is None:`. This is\nverbose (two lines), pollutes scope (pending exists outside if/else), and less Pythonic.\n\nReplace with: `if (pending := self._pending.get(call_id)) is None:`. Benefits: more\nconcise, clearer scope (pending only in else branch where used), idiomatic Python 3.8+\n(PEP 572).\n\nNote: Line 106 has similar pattern but is correct because pending appears in the\ncondition itself, not just the None check.\n',
  should_flag: true,
}
