{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/db_event_handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/db_event_handler.py': [
          {
            end_line: null,
            start_line: 68,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Debug log message uses manual string formatting instead of Python 3.8+ f-string debug syntax. The {var=} syntax is more concise and includes both variable name and value automatically.\n\nCurrent: f"Wrote event to DB: transcript_id={self.transcript_id}, seq={self._sequence_num - 1}, type={event_type}"\n\nBetter: f"Wrote event to DB: {self.transcript_id=} {self._sequence_num - 1=} {event_type=}"\n',
  should_flag: true,
}
