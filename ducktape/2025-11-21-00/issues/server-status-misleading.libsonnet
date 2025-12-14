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
            end_line: 201,
            start_line: 197,
          },
          {
            end_line: 216,
            start_line: 216,
          },
          {
            end_line: 198,
            start_line: 198,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 197-201 define `ServerStatus` enum with docstring \"Agent server runtime status\" and values\n`RUNNING`/`STOPPED`. Line 216 includes `status: ServerStatus` field in `AgentInfoDetailed` model.\n\nThis is misleading: name suggests server status, but actually tracks local agent status (not server).\nFor remote agents (`mode == AgentMode.REMOTE`), neither \"running\" nor \"stopped\" are semantically\ncorrect (we don't know if remote agent is running, and \"stopped\" implies control we don't have).\nStatus confuses local infrastructure availability with agent operational state. Unclear semantics:\ndoes \"running\" mean process running, infrastructure loaded, processing request, or registered?\n\nResolution unclear per user (\"no way this field isn't misleading\"). Possible approaches: replace\nwith `infrastructure_available: bool` for local infrastructure status, use mode-specific optional\nfield `local_infrastructure_running: bool | None` (only for LOCAL mode), or remove entirely if\ninferable from other queries. Needs redesign for clearer semantics and correct remote agent modeling.\n",
  should_flag: true,
}
