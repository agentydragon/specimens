{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/approval_policy/test_policy_resources.py',
        ],
        [
          'adgn/tests/agent/test_policy_validation_reload.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_policy_validation_reload.py': [
          {
            end_line: null,
            start_line: 46,
          },
          {
            end_line: null,
            start_line: 59,
          },
          {
            end_line: 75,
            start_line: 73,
          },
          {
            end_line: null,
            start_line: 96,
          },
          {
            end_line: null,
            start_line: 111,
          },
          {
            end_line: null,
            start_line: 126,
          },
          {
            end_line: null,
            start_line: 149,
          },
        ],
        'adgn/tests/mcp/approval_policy/test_policy_resources.py': [
          {
            end_line: 61,
            start_line: 53,
          },
          {
            end_line: null,
            start_line: 70,
          },
          {
            end_line: 90,
            start_line: 82,
          },
          {
            end_line: null,
            start_line: 103,
          },
          {
            end_line: 138,
            start_line: 130,
          },
          {
            end_line: null,
            start_line: 141,
          },
          {
            end_line: 166,
            start_line: 158,
          },
          {
            end_line: 197,
            start_line: 181,
          },
          {
            end_line: 209,
            start_line: 203,
          },
          {
            end_line: 244,
            start_line: 227,
          },
          {
            end_line: 263,
            start_line: 256,
          },
          {
            end_line: 285,
            start_line: 270,
          },
          {
            end_line: 305,
            start_line: 300,
          },
          {
            end_line: 315,
            start_line: 312,
          },
          {
            end_line: 328,
            start_line: 325,
          },
          {
            end_line: 372,
            start_line: 366,
          },
          {
            end_line: 384,
            start_line: 381,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Approval policy tests lack typed test infrastructure (server stubs + fixture factories) used by other MCP components.\n\nTests directly access private `._mcp_server` internals for tool calls and resource reads instead of using typed server stubs. Multiple tests in test_policy_resources.py use raw `._mcp_server.call_tool()` and `._mcp_server.read_resource()` methods. Tests in test_policy_validation_reload.py access private `_mcp_server._tools` dict directly with pattern `await admin_server._mcp_server._tools["validate_policy"].fn(ValidatePolicyArgs(...))`.\n\nTests also create server instances in class-level fixtures (test_policy_resources.py lines 53-61) instead of using shared fixtures in conftest.py or fixture factories.\n\nOther MCP tests (exec, editor, chat) use typed stub classes for type safety (see exec_stubs.py pattern). Should create `adgn/src/adgn/mcp/testing/approval_policy_stubs.py` with:\n- `ApprovalPolicyServerStub` (reader)\n- `ApprovalPolicyProposerServerStub`\n- `ApprovalPolicyAdminServerStub`\n\nTyped methods provide IDE completion, type checking for tool arguments/returns, more ergonomic API, and avoid accessing private internals.\n\nShould also use shared fixtures or fixture factories for server setup to reduce duplication and ensure consistency across test files.\n',
  should_flag: true,
}
