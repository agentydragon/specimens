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
            end_line: 12,
            start_line: 12,
          },
          {
            end_line: 121,
            start_line: 121,
          },
          {
            end_line: 133,
            start_line: 133,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Module docstring claims tools are exposed as "mcp:{server}.{tool}" (line 12), but\n_collect_tools_live actually creates "mcp__{server}__{tool}" format (lines 121, 133).\nDocstring should match implementation.\n',
  should_flag: true,
}
