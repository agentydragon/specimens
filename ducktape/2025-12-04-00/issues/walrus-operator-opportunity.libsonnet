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
            end_line: 360,
            start_line: 358,
          },
        ],
      },
      note: 'Variable cid assigned then used in conditional check',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: 407,
            start_line: 396,
          },
        ],
      },
      note: 'Variable cid assigned then used in get() and RuntimeError message',
      occurrence_id: 'occ-1',
    },
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
            start_line: 30,
          },
          {
            end_line: null,
            start_line: 31,
          },
        ],
      },
      note: 'Usage example variable could use walrus in list comprehension or call',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Variables assigned on one line then immediately used on the next without any intervening logic. These can use the walrus operator (:=) to combine assignment and use, reducing line count without harming readability.\n',
  should_flag: true,
}
