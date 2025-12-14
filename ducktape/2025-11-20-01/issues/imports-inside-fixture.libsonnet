{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/approval_policy/test_policy_resources.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/approval_policy/test_policy_resources.py': [
          {
            end_line: 37,
            start_line: 35,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Imports are placed inside a fixture function instead of at module top level.\n\nIn test_policy_resources.py lines 35-37, the fixture `engine` contains imports:\n- `from fastmcp.mcp_config import MCPConfig`\n- `from adgn.agent.persist import AgentMetadata`\n\nThis violates PEP 8 and makes dependencies unclear. Move these imports to the top of the module with other imports.\n',
  should_flag: true,
}
