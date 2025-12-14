{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/local_tools.py',
        ],
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py': [
          {
            end_line: 106,
            start_line: 96,
          },
          {
            end_line: 83,
            start_line: 79,
          },
        ],
        'llm/adgn_llm/src/adgn_llm/mini_codex/local_tools.py': [
          {
            end_line: 46,
            start_line: 37,
          },
          {
            end_line: 22,
            start_line: 18,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Truncation/timeout handling is duplicated and can lose the TIMEOUT marker:\n- Both modules implement `_truncate_bytes` and call it in success/timeout branches.\n- In timeout paths, code appends "[TIMEOUT]" before truncation; the marker can be truncated away.\n- The "[TRUNCATED]" literal appears inline in multiple places; hoist to a single constant.\n\nRecommended:\n- Factor a common post-processing step: `truncate_outputs(stdout, stderr, timed_out)` used in both branches.\n- Append "[TIMEOUT]" after truncation (ensuring room for the marker), so the signal is never lost.\n- Hoist markers to constants (e.g., `TRUNCATED_MARKER`, `TIMEOUT_MARKER`) and reuse.\n',
  should_flag: true,
}
