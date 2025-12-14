{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/kernel_exec.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/kernel_exec.py': [
          {
            end_line: 44,
            start_line: 44,
          },
        ],
      },
      note: 'os.open(log_path, ...) — pass Path directly',
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
            end_line: 47,
            start_line: 47,
          },
          {
            end_line: 57,
            start_line: 57,
          },
        ],
      },
      note: 'subprocess args include str(path) casts — pass Path objects where supported',
      occurrence_id: 'occ-1',
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
            end_line: 231,
            start_line: 231,
          },
          {
            end_line: 243,
            start_line: 243,
          },
        ],
      },
      note: 'subprocess invocation building args: avoid converting Path -> str before passing to subprocess',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Many stdlib and library APIs accept os.PathLike objects (pathlib.Path). Prefer passing Path objects directly instead of calling str(path) everywhere.\n\nWhy this matters:\n- Stripping Path -> str casts reduces noise and one-off conversions.\n- Passing Path preserves richer semantics (e.g., platform-specific paths, pathlike wrappers) and is less error-prone.\n- Modern APIs (subprocess, os.open, many stdlib functions) accept Path objects and will do the correct conversion; explicit str() casts are unnecessary.\n',
  should_flag: true,
}
