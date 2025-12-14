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
            end_line: 35,
            start_line: 32,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Use pathlib.Path methods when operating on filesystem paths. Replace `os.path.exists(path)` with `Path(path).exists()` so the code consistently treats paths as Path-like objects and avoids mixing abstractions.\n\nBenefits:\n- Consistent use of Path improves readability and makes subsequent Path operations (open(), joinpath(), etc.) natural without extra conversions.\n- Avoids subtle differences between os.path handling and Path semantics across platforms.\n\nIn this specimen the MCP config loader uses `os.path.exists(path)`; prefer `Path(path).exists()` (or accept a Path at the API boundary) to tighten the contract.\n',
  should_flag: true,
}
