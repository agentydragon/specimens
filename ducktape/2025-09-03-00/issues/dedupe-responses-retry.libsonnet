{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/agent.py',
        ],
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/agent.py': [
          {
            end_line: 42,
            start_line: 42,
          },
        ],
        'llm/adgn_llm/src/adgn_llm/mini_codex/cli.py': [
          {
            end_line: 185,
            start_line: 184,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '`_responses_create_with_retry` is duplicated in mini_codex/agent.py and mini_codex/cli.py. Define it once\n(e.g., in agent.py) and import in the CLI to avoid drift and keep retry policy centralized.\n',
  should_flag: true,
}
