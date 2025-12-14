{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py',
          'llm/adgn_llm/src/adgn_llm/mini_codex/local_server.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/local_server.py': [
          {
            end_line: 24,
            start_line: 23,
          },
        ],
        'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py': [
          {
            end_line: 304,
            start_line: 302,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'McpManager.close() (lines 302-304) only closes stdio handles and never calls close() on LocalServer\ninstances in _state.local_servers, despite LocalServer.close() existing for cleanup (local_server.py:23-24).\nThe instances are never closed anywhere in the codebase (verified: Agent.close() delegates to\nMcpManager.close(), and no other code calls LocalServer.close()), so resources leak across agent runs.\nThe API design is unclear about lifecycle ownership.\n',
  should_flag: true,
}
