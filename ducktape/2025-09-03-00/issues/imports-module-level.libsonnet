{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/agent.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/agent.py': [
          {
            end_line: 29,
            start_line: 29,
          },
          {
            end_line: 46,
            start_line: 46,
          },
          {
            end_line: 85,
            start_line: 85,
          },
        ],
      },
      note: 'function-local imports: _is_retryable, _openai_client, load_mcp_file',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py': [
          {
            end_line: 87,
            start_line: 87,
          },
        ],
      },
      note: 'function-local import in _run_proc',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/local_tools.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/local_tools.py': [
          {
            end_line: 26,
            start_line: 26,
          },
        ],
      },
      note: 'function-local import in _run_proc',
      occurrence_id: 'occ-2',
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
            end_line: 101,
            start_line: 101,
          },
        ],
      },
      note: 'function-local import in _sanitize_name',
      occurrence_id: 'occ-3',
    },
  ],
  rationale: "Function-local imports hide dependencies and impede static analysis and import-time reasoning. Move imports to module level unless there's a compelling runtime justification (e.g., optional heavy dependency, import-time side effects to avoid, or to break import cycles).\n\nPrefer module-level imports to keep dependency graphs visible and simplify testing and bundling.\n",
  should_flag: true,
}
