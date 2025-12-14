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
            end_line: 424,
            start_line: 395,
          },
          {
            end_line: 419,
            start_line: 411,
          },
          {
            end_line: 424,
            start_line: 421,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 395-424 define `approvals_pending_global` that manually constructs JSON dicts with\nstring keys and `json.dumps()` instead of using Pydantic models.\n\nProblems: manual dict construction doesn't catch typos (`{\"call_idd\": x}`); no validation\n(wrong types like `{\"call_id\": 123}` slip through); hard to evolve (field changes require\nmanual updates across dict literals); inconsistent with codebase (other functions use\nPydantic like AgentApprovalsPending); nested tool_call dict manually constructed despite\nexisting ToolCall model; no IDE autocomplete or type checking.\n\nLines 411-419 manually build pending_list dicts; lines 421-424 manually construct result\ndicts with json.dumps.\n\nReplace with Pydantic models (PendingApprovalItem, AgentPendingApprovalsBlock, ResourceBlock)\nand use model_dump_json() for serialization. Benefits: type safety, automatic validation,\nIDE support, reuses existing ToolCall model, framework handles serialization.\n",
  should_flag: true,
}
