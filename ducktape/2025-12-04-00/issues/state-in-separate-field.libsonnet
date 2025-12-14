{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/compositor/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/compositor/server.py': [
          {
            end_line: null,
            start_line: 89,
          },
          {
            end_line: 307,
            start_line: 306,
          },
          {
            end_line: null,
            start_line: 314,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Pinned server tracking uses a separate set _pinned_servers instead of storing the flag in _MountState.\nThis splits mount state across two data structures, making it harder to reason about mount lifecycle.\nThe pinned flag should be a boolean field in _MountState (e.g., pinned: bool = False).\nThis centralizes all mount state in one place and eliminates the need to keep _pinned_servers synchronized.\n',
  should_flag: true,
}
