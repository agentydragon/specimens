{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/local_server.py': [
          {
            end_line: 7,
            start_line: 7,
          },
        ],
        'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py': [
          {
            end_line: 285,
            start_line: 266,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'McpManager.call_tool() has asymmetric calling conventions: stdio tools are awaited (L273),\nbut local handlers are called synchronously (L280). This means local tools doing\ntime.sleep(10) would block the event loop, while "sleep 10" in a stdio tool would not.\nEither local handlers should support async (call with await if coroutine detected), or\nthe assymetry should at least be documented.\n',
  should_flag: true,
}
