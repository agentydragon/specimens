{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: null,
            start_line: 665,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The module-level logger declaration at line 665 in agent.py is placed after all class definitions,\nnear the end of the file. Module-level loggers should be declared at the top of the file, after\nimports and before class/function definitions, to make them easily discoverable and to follow\nstandard Python conventions for module-level constants.\n',
  should_flag: true,
}
