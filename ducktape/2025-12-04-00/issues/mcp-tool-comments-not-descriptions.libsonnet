{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/exec/seatbelt.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/exec/seatbelt.py': [
          {
            end_line: 48,
            start_line: 47,
          },
        ],
      },
      note: 'Comment "Stateless: require a full policy on every call" describes policy field behavior but is invisible to MCP clients',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/exec/seatbelt.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/exec/seatbelt.py': [
          {
            end_line: 53,
            start_line: 52,
          },
        ],
      },
      note: 'Comment "Explicit env to set/override in the child (applied after policy.env passthrough base)" explains env field semantics but is invisible to MCP clients',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: "MCP tool input model fields have comments containing agent-useful information, but these comments are invisible to the MCP client. SandboxExecArgs is an MCP tool input model (used by sandbox_exec tool on line 93), so field documentation that helps agents understand usage should be in Field(description=\"...\") rather than comments.\n\nThis matters because:\n1. Field descriptions are included in the JSON Schema sent to MCP clients\n2. LLM agents see Field descriptions when planning tool calls\n3. Comments are invisible to the MCP protocol and don't help the agent understand usage\n",
  should_flag: true,
}
