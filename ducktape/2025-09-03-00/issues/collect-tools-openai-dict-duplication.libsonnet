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
            end_line: 128,
            start_line: 121,
          },
          {
            end_line: 140,
            start_line: 133,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '_collect_tools_live has duplicated logic for building openai_tools dict entries.\nThe stdio branch (lines 121-128) and local branch (lines 133-140) create identical\ndict structures with "type", "name", "description", "parameters" keys. Should extract\na helper function that takes (server, tool_name, description, params_schema) and\nreturns the tool dict, then call it from both branches. This would eliminate 8 lines\nof duplication and make the tool dict structure easier to maintain.\n',
  should_flag: true,
}
