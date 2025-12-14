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
            end_line: 148,
            start_line: 142,
          },
          {
            end_line: 137,
            start_line: 131,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Both `resolve()` and `await_decision()` silently handle missing call_ids instead of failing fast.\n\nProblem 1 (lines 142-148): `resolve()` uses `pop(call_id, None)` which swallows missing call_ids AND still sends notification even though nothing changed. Should use direct dict access (`self._pending[call_id]`) to raise KeyError on missing entries.\n\nProblem 2 (lines 131-137): `await_decision()` uses `.get(call_id)` and auto-creates new pending approval if missing. Unclear if intentional for first-time calls or if it should raise on truly missing entries.\n\nUse direct dict access to surface errors immediately rather than silently swallowing them. Only notify when state actually changes.\n',
  should_flag: true,
}
