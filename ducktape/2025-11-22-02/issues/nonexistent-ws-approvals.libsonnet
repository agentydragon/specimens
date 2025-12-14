{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/ApprovalTimeline.test.ts',
        ],
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: null,
            start_line: 332,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ApprovalTimeline.test.ts': [
          {
            end_line: null,
            start_line: 486,
          },
          {
            end_line: null,
            start_line: 512,
          },
          {
            end_line: null,
            start_line: 538,
          },
          {
            end_line: null,
            start_line: 601,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "ApprovalTimeline tests (lines 486, 512, 538, 601) reference WebSocket endpoint `/ws/approvals` that doesn't exist in the backend.\n\nBackend evidence (app.py:332): WebSocket routes commented out and never registered (`# register_agents_ws(app)`).\n\nCode comments in stores_channels.ts indicate `/ws/approvals` was intentionally replaced by MCP resource `resource://agents/{agentId}/approvals/pending`.\n\nTests are testing against a non-existent, deprecated API that was replaced by MCP resources. Either update tests to use MCP resources or implement the backend endpoint (uncomment register_agents_ws), but current state is broken.\n",
  should_flag: true,
}
