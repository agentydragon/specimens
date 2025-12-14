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
            end_line: 128,
            start_line: 126,
          },
          {
            end_line: 133,
            start_line: 131,
          },
          {
            end_line: 169,
            start_line: 159,
          },
        ],
      },
      note: 'dump_response_messages/dump_chat_messages/parse_tool_params are one-line wrappers around Pydantic methods',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: 160,
            start_line: 149,
          },
          {
            end_line: null,
            start_line: 269,
          },
        ],
      },
      note: '_normalize_call_arguments accepts dict[str, Any] | str | None but dict case never occurs; defensive check for impossible case',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Trivial wrapper functions that add no abstraction value. Only create wrapper\nfunctions when they add real abstraction (combine multiple operations),\nprovide domain-specific naming clarity, or encapsulate complex logic.\n',
  should_flag: true,
}
