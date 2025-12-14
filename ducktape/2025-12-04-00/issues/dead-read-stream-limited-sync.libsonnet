{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/exec/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/exec/models.py': [
          {
            end_line: 264,
            start_line: 241,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The function `read_stream_limited_sync()` at lines 241-264 is dead code that is never called anywhere in the codebase. A ripgrep search across the entire project shows only the function definition itself, with no call sites.\n\nThe async variant `read_stream_limited_async()` (lines 266+) is actively used in `seatbelt.py` for reading subprocess stdout/stderr streams. The sync version appears to be leftover or speculative code that was never integrated into any actual execution paths.\n\nDocker exec implementations (`_run_session_container` and `_run_ephemeral_container`) use different approaches (custom stream reading from `exec_obj.start()` and `container.log()` API respectively), not the generic stream reader functions.\n\nThis function should be removed.\n',
  should_flag: true,
}
