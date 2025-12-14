{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/handler.py': [
          {
            end_line: 50,
            start_line: 47,
          },
          {
            end_line: 83,
            start_line: 71,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'RunPersistenceHandler.drain promises to raise RuntimeError when any in-flight persistence\ntask fails (docstring lines 71-75), but the _spawn done callback (lines 47-50) discards\ncompleted tasks from _tasks and only logs exceptions without storing them. By the time\ndrain() snapshots _tasks at line 76, any already-completed failed tasks have been removed\nand their exceptions are lost. The gather at line 78 only sees tasks still pending at that\nmoment, so if append_event raised earlier (e.g., due to the 10 MiB payload limit in\nSQLitePersistence.append_event), drain() returns successfully even though events were not\npersisted, violating the documented contract and hiding data loss from the caller.\n',
  should_flag: true,
}
