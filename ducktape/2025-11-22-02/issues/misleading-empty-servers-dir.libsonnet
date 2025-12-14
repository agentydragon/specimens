{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/__init__.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/types.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/__init__.py': [
          {
            end_line: null,
            start_line: 1,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/servers/types.py': [],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `adgn/src/adgn/agent/mcp_bridge/servers/__init__.py` file contains the docstring\n"MCP servers for the MCP bridge." but the servers/ directory contains no actual MCP servers.\n\nAt this commit, the servers/ directory only contains:\n- __init__.py (with misleading docstring)\n- types.py (just type definitions: RunPhase and ApprovalStatus enums)\n\nThe actual MCP server implementation is at `adgn/src/adgn/agent/mcp_bridge/server.py`\n(one level up, not in servers/).\n\nAdditionally, there are two separate types.py files:\n- adgn/src/adgn/agent/mcp_bridge/types.py (parent directory)\n- adgn/src/adgn/agent/mcp_bridge/servers/types.py (servers subdirectory)\n\nThis creates confusion about where types belong and what the servers/ directory is for.\n\nFix:\n1. Move servers/types.py to mcp_bridge/types.py or merge with existing mcp_bridge/types.py\n2. Delete the now-empty servers/ directory\n3. Update any imports that reference servers/types.py\n\nThis would eliminate the misleading directory structure and consolidate type definitions\nin one clear location.\n',
  should_flag: true,
}
