{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_mcp_notifications_flow.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_mcp_notifications_flow.py': [
          {
            end_line: null,
            start_line: 42,
          },
          {
            end_line: null,
            start_line: 159,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 42 and 159 set instructions parameters when creating test MCP servers (NotifyingFastMCP), but these instructions values are never referenced, asserted on, or otherwise used in the test logic. They're immaterial fluff that should be removed.\n\nTest servers should only set parameters that are relevant to what's being tested. Since these tests are about notification flow (ResourceUpdated broadcasts, buffering, etc.), the instructions content is irrelevant.\n",
  should_flag: true,
}
