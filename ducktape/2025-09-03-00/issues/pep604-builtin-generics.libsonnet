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
            end_line: 48,
            start_line: 48,
          },
        ],
      },
      note: 'extra_py: Optional[str] — prefer `str | None`',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/jupyter_mcp_launch.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/jupyter_mcp_launch.py': [
          {
            end_line: 31,
            start_line: 23,
          },
        ],
      },
      note: 'log_dir: Optional[Path] — prefer `Path | None`',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py': [
          {
            end_line: 41,
            start_line: 41,
          },
          {
            end_line: 83,
            start_line: 77,
          },
          {
            end_line: 100,
            start_line: 85,
          },
        ],
      },
      note: 'typing imports and signatures use legacy typing names; modernize to builtin generics and PEP 604 unions',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/agent.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/agent.py': [
          {
            end_line: 7,
            start_line: 7,
          },
          {
            end_line: 24,
            start_line: 24,
          },
          {
            end_line: 76,
            start_line: 76,
          },
          {
            end_line: 111,
            start_line: 111,
          },
        ],
      },
      note: 'ToolMap and sequence/message types use typing.Dict/List — modernize',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/local_server.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/local_server.py': [
          {
            end_line: 4,
            start_line: 4,
          },
          {
            end_line: 19,
            start_line: 19,
          },
        ],
      },
      note: 'get_tools -> Dict[str, ToolDef] should use `dict[str, ToolDef]`',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/local_exec_server.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/local_exec_server.py': [
          {
            end_line: 3,
            start_line: 3,
          },
          {
            end_line: 15,
            start_line: 15,
          },
        ],
      },
      note: 'typing imports and return types use legacy typing names',
      occurrence_id: 'occ-5',
    },
  ],
  rationale: 'Modern Python (3.11+) prefers PEP 604-style unions (e.g., `str | None`) and builtin generics (`list[int]`, `dict[str, Any]`) instead of the legacy `typing.Optional`, `typing.List`, `typing.Dict`, `typing.Tuple`, `typing.Iterator`, etc.\n\nReasons to modernize:\n- Shorter, clearer, and idiomatic type hints that match current guidance and tooling.\n- Avoids indirection via typing aliases and is friendly to forward-refs / `from __future__ import annotations` usage.\n- Reduces cognitive translation for readers (they read `list[int]` directly rather than mentally mapping to `List[int]`).\n\n',
  should_flag: true,
}
