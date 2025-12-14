{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py': [
          {
            end_line: 284,
            start_line: 266,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "McpManager.call_tool() (lines 266-284) treats all MCP tools as if they were shell commands,\nmanufacturing {\"exit\", \"stdout\", \"stderr\"} for everything. For local handlers that return\ndicts, it wraps them as {\"exit\": 0, \"json\": <result>} (line 281-282). This is confused\nabout the abstraction: MCP tools are general-purpose operations that return CallToolResult\n(from mcp package), not necessarily shell command results. CallToolResult has proper fields\n(isError, content, structuredContent, meta) for representing tool execution results.\n\nThe method should use CallToolResult throughout instead of manufacturing exit codes for\nnon-command tools. This confusion causes issues like double-wrapping where LocalExecServer's\n{\"exit\": 1, \"stderr\": \"error\"} gets wrapped as {\"exit\": 0, \"json\": {\"exit\": 1, ...}},\nhiding failures from the agent.\n",
  should_flag: true,
}
