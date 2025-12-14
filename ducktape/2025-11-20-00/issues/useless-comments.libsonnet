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
            end_line: 113,
            start_line: 112,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Comment states what break statement obviously does: \"Break sender loop - connection\nis broken\". The break is inside an exception handler after logging \"WebSocket send\nfailed\", so context is already clear.\n\nComments should explain why, not what. This comment adds no information beyond what's\nvisible in the control flow and surrounding code.\n",
  should_flag: true,
}
