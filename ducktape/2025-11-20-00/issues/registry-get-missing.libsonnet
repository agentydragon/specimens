{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/status_shared.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/status_shared.py': [
          {
            end_line: 114,
            start_line: 114,
          },
        ],
      },
      note: 'Called in build_agent_status_core: c = registry.get(agent_id)',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 516,
            start_line: 516,
          },
        ],
      },
      note: 'Called in agent_ui_state_resource: runtime = registry.get(agent_id)',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'InfrastructureRegistry.get() method is called but does not exist in the class definition.\n\nThe calls should likely use get_running_infrastructure() instead,\nbased on the usage pattern where the result is checked for None.\n',
  should_flag: true,
}
