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
            end_line: 249,
            start_line: 245,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Iteration catches KeyError when agent isn't initialized (lines 245-249):\n```python\nfor agent_id in self.known_agents():\n    try:\n        mode = self.get_agent_mode(agent_id)\n    except KeyError:\n        continue\n```\n\nThis is a code smell indicating poorly structured iteration. We iterate over\n`known_agents()` (returns ALL agent IDs), then call `get_agent_mode()` which\nraises KeyError for uninitialized agents. The mismatch between iteration source\nand accessed data forces the try/except.\n\nShould iterate over a structure where agent mode is guaranteed to exist:\n```python\nfor agent_id, entry in self._agents.items():\n    if entry.agent is None:\n        continue  # Skip uninitialized agents\n    agent = entry.agent\n    infra = agent.running\n    # ... rest of logic with guaranteed agent data\n```\n\nOr explicitly decide whether to include uninitialized agents with different status.\n",
  should_flag: true,
}
