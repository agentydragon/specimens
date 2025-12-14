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
            end_line: 196,
            start_line: 187,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'ConnectionManager._send_direct_all is never called (ripgrep finds only the definition).\nDead code should be removed.\n',
  should_flag: true,
}
