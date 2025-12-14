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
            end_line: 101,
            start_line: 101,
          },
          {
            end_line: 121,
            start_line: 121,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'For small, closed sets of string-valued discriminants (e.g. the tool policy values "auto", "required", "none"), prefer a StrEnum rather than ad-hoc Literal annotations.\n\nA StrEnum centralizes the allowed values as runtime objects, improves discoverability and IDE support, makes parsing and validation simpler (ToolPolicy(value) will raise on unknown values), and reduces accidental typos in call sites.\n',
  should_flag: true,
}
