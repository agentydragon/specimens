{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
        [
          'adgn/src/adgn/mcp/policy_gateway/middleware.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 64,
            start_line: 63,
          },
          {
            end_line: 71,
            start_line: 71,
          },
          {
            end_line: 96,
            start_line: 96,
          },
          {
            end_line: 102,
            start_line: 102,
          },
          {
            end_line: 119,
            start_line: 117,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 21,
            start_line: 21,
          },
          {
            end_line: 51,
            start_line: 51,
          },
          {
            end_line: 56,
            start_line: 56,
          },
          {
            end_line: 57,
            start_line: 57,
          },
        ],
        'adgn/src/adgn/mcp/policy_gateway/middleware.py': [
          {
            end_line: 16,
            start_line: 16,
          },
          {
            end_line: 293,
            start_line: 291,
          },
          {
            end_line: 297,
            start_line: 297,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 63-64 define `ApprovalRequest(BaseModel)` with single field `tool_call: ToolCall`.\n\nThis is a pointless wrapper: no validation, methods, or behavior. All usage sites immediately\nunwrap it to access `.tool_call`. Middleware.py:291-297 wraps `ToolCall` in `ApprovalRequest`,\npasses to `await_decision()`, then immediately unwraps with `req.tool_call` for notify.\nServers/agents.py:56 extracts `request.tool_call` for `PendingApproval` construction.\n\nDelete `ApprovalRequest` class and replace with direct `ToolCall` usage throughout:\n- Change `PendingApproval.request: ApprovalRequest` → `tool_call: ToolCall` (line 71)\n- Change `await_decision(call_id, request: ApprovalRequest)` → `tool_call: ToolCall` (line 96)\n- Change `pending() -> dict[str, ApprovalRequest]` → `dict[str, ToolCall]` (line 117)\n- Update middleware.py/servers/agents.py callers to pass `ToolCall` directly\n\nThis eliminates unnecessary indirection and wrap/unwrap overhead.\n',
  should_flag: true,
}
