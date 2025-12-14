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
            end_line: 92,
            start_line: 85,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'For simple file I/O, prefer using Path.read_text()/Path.write_text() or Path.open() instead of calling open(str(path), ...) manually.\n\nBenefits:\n- Concise one-liners for common patterns.\n- Keeps types as Path objects and avoids repeated str() conversions.\n- Clearer intent and small performance/readability improvements.\n',
  should_flag: true,
}
