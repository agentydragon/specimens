{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 855,
            start_line: 841,
          },
          {
            end_line: 878,
            start_line: 858,
          },
          {
            end_line: 898,
            start_line: 884,
          },
          {
            end_line: 915,
            start_line: 901,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Four notifier factory functions (lines 841-855, 858-878, 884-898, 901-915) follow the\nexact same pattern with duplicated boilerplate: sync notifier schedules broadcast in\nevent loop via `loop.create_task(server.broadcast_resource_updated(uri))` with\n`add_done_callback` for success/failure logging, fire-and-forget.\n\n**Duplicated notifiers:**\n1. `make_policy_notifier` (841-855) - takes URI parameter\n2. `make_approval_hub_notifier` (858-878) - broadcasts 3 approval resources\n3. `make_ui_state_notifier` (884-898) - uses `resources.agent_ui_state(aid)`\n4. `make_session_state_notifier` (901-915) - uses `resources.agent_session_state(aid)`\n\n**Why this is problematic:**\n- Same 10-15 line pattern repeated 4 times (~60 lines total)\n- Changes to broadcast pattern must update 4 identical copies\n- Error-prone: easy to update one notifier but forget others\n\n**Fix:** Extract into `make_sync_broadcast_notifier(uri_getter, log_context)` helper that\nhandles the common pattern (get URIs, schedule broadcasts, add callbacks). Reduces to ~15\nlines + 4 simple calls. Note: `make_mount_listener` (lines 918-926) is different (async,\nawaits broadcast) and should not be included.\n',
  should_flag: true,
}
