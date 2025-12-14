{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/jupyter_sandbox_compose.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/jupyter_sandbox_compose.py': [
          {
            end_line: 6,
            start_line: 5,
          },
        ],
      },
      note: 'Unused: os, subprocess',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/wrapper.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/wrapper.py': [
          {
            end_line: null,
            start_line: 4,
          },
          {
            end_line: null,
            start_line: 14,
          },
          {
            end_line: null,
            start_line: 17,
          },
          {
            end_line: null,
            start_line: 19,
          },
        ],
      },
      note: 'Unused: asyncio, dataclass, Any, Field, model_validator (BaseModel is used)',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Unused imports.\n',
  should_flag: true,
}
