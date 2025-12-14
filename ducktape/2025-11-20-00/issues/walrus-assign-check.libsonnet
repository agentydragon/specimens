{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/registry.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/registry.py': [
          {
            end_line: 95,
            start_line: 93,
          },
        ],
      },
      note: 'In get_agent() - assign agent row then check None',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 245,
            start_line: 243,
          },
        ],
      },
      note: 'In get_policy_proposal() - assign proposal then check None',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: 336,
            start_line: 335,
          },
        ],
      },
      note: 'In agent.py - assign results.get() then check None',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/state.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/state.py': [
          {
            end_line: 133,
            start_line: 131,
          },
        ],
      },
      note: 'In state.py - assign _find_last_tool_index then check None (occurrence 1)',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/state.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/state.py': [
          {
            end_line: 153,
            start_line: 151,
          },
        ],
      },
      note: 'In state.py - assign _find_last_tool_index then check None (occurrence 2)',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/state.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/state.py': [
          {
            end_line: 178,
            start_line: 176,
          },
        ],
      },
      note: 'In state.py - assign _find_last_tool_index then check None (occurrence 3)',
      occurrence_id: 'occ-5',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/auth.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/auth.py': [
          {
            end_line: 95,
            start_line: 93,
          },
        ],
      },
      note: 'In get_agent_id() - assign token lookup then check None',
      occurrence_id: 'occ-6',
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
            end_line: 329,
            start_line: 327,
          },
        ],
      },
      note: 'In servers/agents.py - assign get_local_runtime then check None (occurrence 1)',
      occurrence_id: 'occ-7',
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
            end_line: 353,
            start_line: 351,
          },
        ],
      },
      note: 'In servers/agents.py - assign get_local_runtime then check None (occurrence 2)',
      occurrence_id: 'occ-8',
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
            end_line: 376,
            start_line: 374,
          },
        ],
      },
      note: 'In servers/agents.py - assign get_local_runtime then check None (occurrence 3)',
      occurrence_id: 'occ-9',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 163,
            start_line: 162,
          },
        ],
      },
      note: 'In server.py - assign for ternary expression',
      occurrence_id: 'occ-10',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/mcp_routing.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/mcp_routing.py': [
          {
            end_line: 111,
            start_line: 107,
          },
        ],
      },
      note: 'In mcp_routing.py - dict.get with useless "Look up token" comment',
      occurrence_id: 'occ-11',
    },
  ],
  rationale: 'Twelve locations use assign-then-check patterns instead of walrus operator (:=). Common patterns:\nassign value then check if None (registry.py:93-95, approvals.py:243-245, agent.py:335-336),\nassign for ternary/conditional (server.py:162-163), dict.get with None check (mcp_routing.py:107-111\nwith useless "Look up token" comment), and multiple occurrences of assign-then-None-check in\nstate.py (lines 131-133, 151-153, 176-178) and servers/agents.py (lines 327-329, 351-353, 374-376).\n\nUse walrus operator to combine assignment and condition: `if (row := await get_agent(...)) is None`,\n`return x.y if (x := expr) else None`, `if not (info := dict.get(...)): ...`. This is more concise\n(combines two lines into one), clearer scope (variable exists only where needed), and standard Python\nidiom (PEP 572). Not applicable when variable is reassigned inside conditional block.\n',
  should_flag: true,
}
