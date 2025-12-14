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
            end_line: 422,
            start_line: 400,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "approvals_pending_global builds URIs and JSON by accessing approval.call_id, approval.tool,\nand approval.args, but PendingApproval only exposes tool_call (a ToolCall object) and timestamp.\nThe code raises AttributeError on every invocation because these attributes don't exist at the\nPendingApproval level - they need to be accessed via approval.tool_call.call_id,\napproval.tool_call.name, and approval.tool_call.args_json respectively.\n",
  should_flag: true,
}
