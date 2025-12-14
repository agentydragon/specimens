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
            end_line: 192,
            start_line: 184,
          },
        ],
      },
      note: 'Multiple quoted return annotations in methods',
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
            end_line: 191,
            start_line: 191,
          },
          {
            end_line: 226,
            start_line: 226,
          },
        ],
      },
      note: 'from_config and from_servers classmethods use -> "McpManager" despite __future__ annotations enabled',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Avoid quoted return annotations (e.g. `-> "McpManager"`). Enable `from __future__ import annotations` at module top and use real types (e.g., `-> McpManager`) or PEP 604 unions where appropriate.\n\nWhy this matters:\n- Quoted annotations are a historical workaround; modern code should use postponed evaluation (`from __future__ import annotations`) so annotations are real types for static tools while avoiding runtime evaluation costs and string fragility.\n- Removing quotes improves clarity, IDE/type-checker support, and reduces bugs where strings are misspelled or not updated during refactors.\n\nSuggested fix: add `from __future__ import annotations` at the module top and replace quoted return/type annotations with the direct types (optionally keep `typing` imports minimal when needed).\n',
  should_flag: true,
}
