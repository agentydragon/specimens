{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/ApprovalTimeline.svelte',
        ],
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 1,
            start_line: 1,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ApprovalTimeline.svelte': [
          {
            end_line: 61,
            start_line: 54,
          },
          {
            end_line: 98,
            start_line: 92,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "ApprovalTimeline.svelte lines 54-61 subscribe to WebSocket endpoint `/ws/approvals?agent_id=...`\nthat doesn't exist in backend (app.py has TODO placeholder). Lines 64-87 expect messages with\ntype `approval_decision` (tool_call/outcome/reason/timestamp) and `approvals_snapshot` (timeline)\nthat backend never sends.\n\nThis creates non-functional feature (component appears to work but receives no updates), silent\nfailure (connection fails with no user feedback), misleading UX (suggests live updates work),\nwasted resources (attempts connection that always fails), and incomplete implementation (frontend\nbuilt for missing backend). Lines 92-98 handle errors with console.warn/log only.\n\nOptions: implement backend (add WebSocket endpoint with event subscription), remove WebSocket code\n(replace with polling setInterval), or use MCP subscriptions (subscribe to approval timeline resource\nvia MCP client - fits 2-level compositor architecture better). Recommendation: short term remove\nWebSocket or use MCP subscriptions; long term implement endpoint if needed; best use MCP (fits\narchitecture). Similar issues: GlobalApprovalsList expects non-existent /api/mcp endpoint.\n",
  should_flag: true,
}
