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
            end_line: 106,
            start_line: 96,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The parameter name `system` is generic/overloaded and can be confused with modules/variables.\nPrefer a more specific name like `system_message` to communicate intent clearly (pairs with\n`SYSTEM_INSTRUCTIONS`). Rename the arg and private field for clarity.\n',
  should_flag: true,
}
