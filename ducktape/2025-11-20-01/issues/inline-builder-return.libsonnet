{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 67,
            start_line: 63,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 63-67 create MCPInfrastructure instance assigned to builder, then immediately\nuse it in return statement to call builder.start(). This single-use intermediate\nvariable should be inlined.\n\nVariable name adds no semantic value beyond class name. Standard pattern: create\nobject and call method in one expression. Chaining constructor → method is clear\nand readable. Common Python idiom for builder/factory patterns.\n\nInline to: return await MCPInfrastructure(...).start(mcp_config). More concise\nwithout sacrificing readability. Similar pattern found at runtime/builder.py:74\nand runtime/infrastructure.py:57 - all should be updated consistently.\n',
  should_flag: true,
}
