{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/constants.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/resources.py',
        ],
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
        [
          'adgn/src/adgn/mcp/approval_policy/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 181,
            start_line: 178,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/resources.py': [
          {
            end_line: 12,
            start_line: 12,
          },
          {
            end_line: 69,
            start_line: 67,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 470,
            start_line: 470,
          },
        ],
        'adgn/src/adgn/mcp/_shared/constants.py': [
          {
            end_line: 48,
            start_line: 47,
          },
        ],
        'adgn/src/adgn/mcp/approval_policy/server.py': [
          {
            end_line: 132,
            start_line: 132,
          },
          {
            end_line: 142,
            start_line: 142,
          },
          {
            end_line: 148,
            start_line: 148,
          },
          {
            end_line: 161,
            start_line: 161,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Approval policy URIs use global namespace (`resource://approval-policy/policy.py`,\n`resource://approval-policy/proposals`) but should be agent-scoped like other resources\n(`resource://agents/{id}/approvals/pending`, `/history`, `/policy/proposals`, `/policy/state`, etc.).\n\nThis creates architectural inconsistency (per-agent servers use global URIs), duplication (agents\nserver exposes `resource://agents/{id}/policy/proposals` but approval policy server uses global\nnamespace - which to use?), multi-agent ambiguity (global URI doesn't indicate which agent), redundant\nnotifications (approvals.py:178-181 notifies both global and agent-scoped URIs), and inconsistent\nconstruction (manual f-strings and helpers both use global namespace).\n\nReplace global URIs with agent-scoped pattern `resource://agents/{agent_id}/approval-policy/...`.\nConvert constants to functions taking agent_id. Update sites: constants definition\n(mcp/_shared/constants.py:47-48), helper functions (resources.py:12, 67-69), notification calls\n(approvals.py:179 - remove), manual URI construction (agents.py:470), MCP resource registration\n(approval_policy/server.py:132, 142, 148, 161). Provides consistent namespace, clear ownership,\nno redundant notifications, matches \"per-agent server\" architecture.\n",
  should_flag: true,
}
