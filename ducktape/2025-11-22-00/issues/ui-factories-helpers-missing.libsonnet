{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/GlobalApprovalsList.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/GlobalApprovalsList.svelte': [
          {
            end_line: 71,
            start_line: 69,
          },
          {
            end_line: 78,
            start_line: 78,
          },
          {
            end_line: 107,
            start_line: 107,
          },
          {
            end_line: 121,
            start_line: 115,
          },
          {
            end_line: 142,
            start_line: 138,
          },
          {
            end_line: 180,
            start_line: 175,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "GlobalApprovalsList.svelte contains explicit tool/resource constructions at 6 locations instead\nof using factories/helpers with defaults: MCP client creation (line 69: createMCPClient with\nname/url/token), resource subscription (line 78: subscribeToResource with URI), resource reading\n(line 107: readResource with URI), approval parsing (lines 115-121: manual object construction\nwith agent_id/tool_call/timestamp), approve tool call (lines 138-142: callTool with approve_tool_call\nand agent_id/call_id), reject tool call (lines 175-180: callTool with reject_tool_call and\nagent_id/call_id/reason).\n\nThis creates verbose boilerplate (repeated patterns), no default values (must specify all parameters),\nhard to test (can't mock without recreating full objects), duplication (same patterns across component),\nand fragile (API changes require updating many call sites).\n\nCreate factories/helpers: `createApprovalsClient(options?)` with default name/url/token,\n`fetchPendingApprovals(client)`, `approveToolCall(client, agentId, callId)`,\n`parseApprovalContents(contents)`. Provides default values, centralized logic, easier testing\n(mock helpers not raw calls), type safety, less duplication.\n",
  should_flag: true,
}
