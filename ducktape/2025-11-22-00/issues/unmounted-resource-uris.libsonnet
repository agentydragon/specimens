{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/resources.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/resources.py': [
          {
            end_line: 67,
            start_line: 16,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `resources.py` module defines ten parameterized resource URI helper functions\n(agent_state, agent_snapshot, agent_mcp_state, agent_approvals_pending, agent_approvals_history,\nagent_approval, agent_policy_proposals, agent_policy_state, agent_session_state, agent_ui_state)\nthat construct URIs like `resource://agents/{agent_id}/state`, but only two URIs are actually\nmounted as resources in the MCP server: `resource://agents/list` and `resource://agents/{agent_id}/info`\n(server.py, lines 251-284).\n\n**Problems:**\n1. Dead code: 10 URI helpers defined but never used\n2. Confusing API: functions suggest resources exist when they don't\n3. Maintenance burden: unused code + misleading docstrings\n4. No clear plan: unclear if future features or abandoned work\n5. Constants duplication: same URIs also in `_shared/constants.py`\n\n**The correct approach:**\nEither implement the missing resources or delete the unused helpers. Recommended: delete helpers\nfor unmounted resources, keeping only what's actually implemented. Search for usages first; if used\nonly in tests expecting future work, move to test fixtures.\n\n**Benefits of cleanup:**\n1. No dead code, clear API surface\n2. Less confusion for new developers\n3. Honest documentation reflecting actual capabilities\n4. Smaller maintenance burden\n",
  should_flag: true,
}
