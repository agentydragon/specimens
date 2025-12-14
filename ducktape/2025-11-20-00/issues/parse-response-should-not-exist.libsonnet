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
            end_line: 123,
            start_line: 111,
          },
        ],
      },
      note: 'parse_response_messages function',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/llm/sysrw/openai_typing.py',
        ],
      ],
      files: {
        'adgn/src/adgn/llm/sysrw/openai_typing.py': [
          {
            end_line: 148,
            start_line: 136,
          },
        ],
      },
      note: 'parse_chat_messages function',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'parse_response_messages accepts Any and converts to list[ResponseOutputMessage].\nThis function exists because callers hold untyped data and need runtime validation.\n\nProblem: This defers type safety to runtime. Callers should receive properly\ntyped data from API responses directly.\n\nShould instead:\n1. Type API response parsing at source (where data enters system)\n2. Callers work with list[ResponseOutputMessage] | None from the start\n3. No runtime validation needed in application layer\n\nThe function is a symptom of inadequate typing at API boundary.\n\nIf using OpenAI SDK or similar, the response should already be typed.\nIf parsing raw JSON, parse to typed Response object immediately, not dict[str, Any].\n\nBenefits of proper typing at source:\n- Type errors caught at compile time, not runtime\n- No defensive validation in application code\n- Clearer data flow: typed from API → typed throughout\n- No Any spreading through codebase\n\nSame principle applies to parse_chat_messages.\n',
  should_flag: true,
}
