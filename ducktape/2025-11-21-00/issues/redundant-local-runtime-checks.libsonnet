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
            end_line: 326,
            start_line: 322,
          },
          {
            end_line: 349,
            start_line: 345,
          },
          {
            end_line: 371,
            start_line: 367,
          },
          {
            end_line: 566,
            start_line: 561,
          },
          {
            end_line: 649,
            start_line: 644,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Five functions check both `get_agent_mode(agent_id) != AgentMode.LOCAL` and then\n`get_local_runtime(agent_id) is None`. The second check is redundant given the invariant:\n**mode == LOCAL ⟺ local_runtime is not None**.\n\nEvidence: RunningAgent class (server.py:43) defines `local_runtime: LocalAgentRuntime | None`\nwith comment "None for bridge agents"; get_local_runtime docstring says "Returns None if\nagent is not local"; register_local_agent always sets mode=LOCAL with a local_runtime value.\n\nLines 322-326, 345-349, 367-371: fully redundant (check mode != LOCAL, then check\nlocal_runtime is None). If mode is LOCAL, local_runtime is never None.\n\nLines 561-566, 644-649: partially redundant (check mode != LOCAL, then check\n`local_runtime is None or local_runtime.session is None`). The `local_runtime is None`\npart is redundant; only the `.session` / `.agent` field checks are valid.\n\nRemove redundant checks; trust the documented invariant. Benefits: clearer code, simpler\nerror handling.\n',
  should_flag: true,
}
