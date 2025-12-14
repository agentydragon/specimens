{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/models.py',
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/models.py': [
          {
            end_line: null,
            start_line: 65,
          },
        ],
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: null,
            start_line: 342,
          },
          {
            end_line: null,
            start_line: 389,
          },
          {
            end_line: null,
            start_line: 415,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Run model stores event_count: Mapped[int] (models.py:65) that duplicates information\nalready available from the events relationship.\n\nevent_count is manually incremented on every event insert (sqlite.py:389):\nupdate(Run).where(Run.id == str(run_id)).values(event_count=Run.event_count + 1)\n\nThis is:\n- Redundant: count is derivable from len(run.events) or COUNT query\n- Error-prone: risks desync if increments are missed or duplicated\n- Additional write overhead on every event\n\nShould remove event_count field and compute when needed:\n- For queries: SELECT COUNT(*) FROM events WHERE run_id = ?\n- For loaded objects: len(run.events)\n- For aggregation: Use SQLAlchemy func.count()\n\nStorage denormalization only justified for performance-critical paths, not evident here.\n',
  should_flag: true,
}
