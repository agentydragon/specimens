{
  occurrences: [
    {
      expect_caught_from: [
        [
          'wt/src/wt/client/wt_client.py',
        ],
        [
          'wt/src/wt/client/handlers.py',
        ],
      ],
      files: {
        'wt/src/wt/client/handlers.py': [
          {
            end_line: 258,
            start_line: 250,
          },
        ],
        'wt/src/wt/client/wt_client.py': [
          {
            end_line: 113,
            start_line: 108,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The logic for reading and parsing the daemon PID file is duplicated in two places:\nwt_client.py lines 108-113 (is_daemon_running) and handlers.py lines 250-258 (kill_daemon).\nBoth follow the same pattern: async read via `asyncio.to_thread`, strip, check if empty,\nparse int.\n\n**Why this is problematic:**\n- Same pattern repeated in two locations\n- Changes to PID file format or error handling must update multiple places\n- Risk of inconsistent behavior if one location is updated but not the other\n- Violates DRY principle\n\n**Fix:** Extract into a shared `async def read_daemon_pid(pid_path: Path) -> int | None`\nhelper that handles the read, strip, empty check, and int parse with error handling.\nReturns PID as int if valid, None otherwise. Benefits: single source of truth, easier\nto maintain, consistent error handling, more testable. Note: line 536 in wt_client.py\nalso reads the PID file but synchronously for debug output (different requirements,\nfine as-is).\n',
  should_flag: true,
}
