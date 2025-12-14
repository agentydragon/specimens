{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py': [
          {
            end_line: 204,
            start_line: 199,
          },
          {
            end_line: 290,
            start_line: 285,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `try/except` around `mcp_manager.instruction_block()` appears twice with identical logic\n(once in the plain-turn path and once in the tool-call path). Extract a small helper (e.g.,\n`_append_mcp_instructions(base: str, m: McpManager|None) -> str`) and reuse it in both places.\n\nThis reduces duplication, centralizes the narrow exception handling decision, and keeps\nthe instruction composition logic consistent across call sites.\n',
  should_flag: true,
}
