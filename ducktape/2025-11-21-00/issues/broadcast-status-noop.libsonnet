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
            end_line: 225,
            start_line: 223,
          },
          {
            end_line: 140,
            start_line: 140,
          },
          {
            end_line: 162,
            start_line: 162,
          },
          {
            end_line: 395,
            start_line: 395,
          },
          {
            end_line: 443,
            start_line: 443,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 223-225 define `broadcast_status` as a no-op with comment \"WebSocket status broadcasts\nremoved\". This is dead code: the method does nothing (explicit pass), the comment confirms\nthe functionality was intentionally removed (not temporarily stubbed), and all call sites\nawait a no-op wasting cycles.\n\nFour call sites: line 140 `await self.broadcast_status(True, active)`, line 162 (same),\nline 395 `await self._manager.broadcast_status(True, run_id)`, line 443\n`await self._manager.broadcast_status(True, None)`.\n\nDelete the method definition and all four call sites. Since it's a no-op, removal has zero\nbehavioral change. Keeping dead code creates maintenance burden and confuses readers.\n",
  should_flag: true,
}
