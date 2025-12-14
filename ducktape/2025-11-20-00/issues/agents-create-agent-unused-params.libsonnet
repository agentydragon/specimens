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
            end_line: 798,
            start_line: 777,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The create_agent tool accepts preset and system_message parameters and documents them in its\ndocstring, but the implementation generates an ID and calls registry.create_agent(agent_id)\nwithout using either parameter. The tool does not fulfill its documented contract.\n',
  should_flag: true,
}
