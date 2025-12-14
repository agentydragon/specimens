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
            end_line: 419,
            start_line: 413,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'approvals_pending_global builds approval_data as a raw dict and serializes it with json.dumps().\nStructured data should be handled in Pydantic models - either extend PendingApproval to include\nagent_id, or create a dedicated model for the global mailbox items. This provides validation,\ntype safety, and consistent serialization.\n',
  should_flag: true,
}
