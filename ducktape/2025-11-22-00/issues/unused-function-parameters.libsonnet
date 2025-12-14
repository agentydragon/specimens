{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/auto_attach.py',
        ],
        [
          'adgn/src/adgn/agent/runtime/handlers.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/auto_attach.py': [
          {
            end_line: 42,
            start_line: 40,
          },
        ],
        'adgn/src/adgn/agent/runtime/handlers.py': [
          {
            end_line: 31,
            start_line: 19,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Two functions declare parameters never used in the function body. Vestigial\nfrom previous implementations.\n\nProblem 1 (auto_attach.py:40-42): `attach_default_servers()` declares\n`agent_id`, `persistence`, and `docker_client` but never uses them. Only\n`comp`, `ui_bus`, and `approval_engine` are used.\n\nProblem 2 (handlers.py:19-31): `build_handlers()` declares `approval_engine`,\n`approval_hub`, and `agent_id` but never uses them. Only `poll_notifications`,\n`manager`, `persistence`, `get_run_id`, and `ui_bus` are used.\n\nLikely happened during refactoring: helper functions changed to get data\nelsewhere, parameters removed from helpers but not from top-level functions.\nFix: remove unused parameters. Use Ruff ARG001/ARG002 to detect.\n',
  should_flag: true,
}
