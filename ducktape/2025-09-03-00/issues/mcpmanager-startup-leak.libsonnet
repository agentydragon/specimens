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
            end_line: 224,
            start_line: 191,
          },
        ],
      },
      note: 'In from_config()',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py': [
          {
            end_line: 258,
            start_line: 226,
          },
        ],
      },
      note: 'In from_servers()',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'McpManager.from_config() and from_servers() start _LiveServer instances sequentially without\ncleanup on failure. If await h.start() raises on server N, or if _collect_tools_live() fails,\nthe method propagates the exception without closing the already-started servers in handles,\nleaving MCP subprocesses running. The startup should clean up any already started servers on failure.\n',
  should_flag: true,
}
