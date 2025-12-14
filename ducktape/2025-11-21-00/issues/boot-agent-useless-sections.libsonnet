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
            end_line: 829,
            start_line: 815,
          },
          {
            end_line: 825,
            start_line: 821,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `boot_agent` docstring (lines 815-829) has Args and Returns sections that\nrestate the function signature.\n\nArgs section: "agent_id: ID of the agent to boot" restates parameter name, function\nname, and type annotation `agent_id: AgentID`.\n\nReturns section: "SimpleOk confirming the agent is ready" restates return type\nannotation `-> SimpleOk` and obvious success/fail pattern.\n\nSummary (what/why) and Raises (KeyError on missing agent) are valuable; Args/Returns\nadd zero information.\n\n**Fix:** Delete Args/Returns sections, keep summary and Raises. Reduces docstring\nfrom 15 to 9 lines, no redundancy, keeps only valuable information. Args/Returns\nshould only be included when they provide information beyond the type signature.\n',
  should_flag: true,
}
