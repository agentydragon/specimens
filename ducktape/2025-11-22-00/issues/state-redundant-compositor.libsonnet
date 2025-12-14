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
            end_line: 68,
            start_line: 66,
          },
          {
            end_line: 78,
            start_line: 76,
          },
          {
            end_line: 91,
            start_line: 91,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "status_shared.py AgentStatusCore duplicates data available via the 2-layer\ncompositor. Three fields (mcp: McpState lines 76-78, policy: PolicyState lines\n66-68, pending_approvals: int line 91) wrap compositor resources without adding\nbehavior.\n\nImpact: Type indirection (must access .entries for data), manual state tracking\ninstead of querying compositor, sync risks between custom status and MCP\nresources, redundant APIs.\n\nThese fields map to MCP resources: mcp → resources://compositor/servers,\npolicy → resources://approval-policy/policy.py, pending_approvals →\nlen(resources://approval-policy/pending).\n\nRemove the three redundant fields from AgentStatusCore. Clients should query\nMCP resources directly for server state, policy, and pending approvals.\n\nBenefits: Single source of truth (MCP resources authoritative), automatic updates\nvia resource subscriptions, consistent interface, simpler status model containing\nonly non-MCP state.\n\nPrinciple: Don't duplicate MCP-available data in custom APIs. Let clients use\nstandard MCP protocol to avoid sync issues.\n",
  should_flag: true,
}
