{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/presets.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/presets.py': [
          {
            end_line: null,
            start_line: 30,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'AgentPreset.modified_at uses str for timestamp instead of datetime type. Timestamps\nshould use datetime, not strings, for type safety, operations (comparison, arithmetic),\nand automatic ISO-8601 serialization. Pydantic handles datetime serialization to JSON\nautomatically. Only use str when interfacing with systems requiring precise control\nover format.\n',
  should_flag: true,
}
