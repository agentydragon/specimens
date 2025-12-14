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
            end_line: 101,
            start_line: 95,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '_LiveServer.close() awaits session.__aexit__() and only afterwards closes the stdio\ntransport context manager. If the session close raises, the stdio cleanup never runs,\nleaking subprocess pipes and file descriptors.\n',
  should_flag: true,
}
