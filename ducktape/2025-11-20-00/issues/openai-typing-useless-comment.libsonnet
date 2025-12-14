{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/llm/sysrw/openai_typing.py',
        ],
      ],
      files: {
        'adgn/src/adgn/llm/sysrw/openai_typing.py': [
          {
            end_line: 108,
            start_line: 108,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 108's comment \"Removed parse_tool_call...\" refers to deleted functions and should be\nremoved as useless historical noise.\n",
  should_flag: true,
}
