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
            end_line: 105,
            start_line: 80,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'chat_param_message_content_as_text (lines 75-105) has repetitive match cases with nearly\nidentical logic for each role. Instead of handling each role separately (ASSISTANT, USER,\nSYSTEM, TOOL/FUNCTION/DEVELOPER) with duplicated content-parsing code, it could have a single\nupfront check that the role is in a list of understood roles (fail-fast if not), then apply\nthe same content-parsing logic for all cases.\n',
  should_flag: true,
}
