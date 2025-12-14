{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 165,
            start_line: 158,
          },
          {
            end_line: 177,
            start_line: 168,
          },
          {
            end_line: 237,
            start_line: 224,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Methods `get_agent_mode` (lines 168-177), `get_infrastructure` (lines 158-165), and\n`remove_agent` (lines 224-237) duplicate the same "get agent or raise KeyError" logic.\n\nEach method: (1) Checks if agent_id in self._agents. (2) Gets self._agents[agent_id].agent.\n(3) Checks if agent is None. (4) Raises KeyError with similar messages. Only difference is\nwhat field they return (agent.mode vs agent.running) or what they do with the agent.\n\nClassic code duplication. Extract common helper `_get_agent_or_raise(agent_id) -> RunningAgent`\nthat consolidates the lookup logic and raises KeyError if not found/initialized. Then simplify\nall callers to one-liners: `return self._get_agent_or_raise(agent_id).mode`,\n`return self._get_agent_or_raise(agent_id).running`, etc.\n\nBenefits: DRY - single implementation of lookup logic, consistent error messages, easier to\nmaintain. Could even inline some one-liners if called in few places.\n',
  should_flag: true,
}
