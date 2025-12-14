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
            end_line: 85,
            start_line: 85,
          },
          {
            end_line: 92,
            start_line: 92,
          },
          {
            end_line: 99,
            start_line: 99,
          },
          {
            end_line: 104,
            start_line: 104,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "chat_param_message_content_as_text (lines 75-105) claims to \"extract text content\", but when\ncontent is not a plain string (e.g., multi-part ChatCompletion*MessageParam with structured\ncontent like [{'type': 'text', 'text': 'hi'}]), it falls back to str(content) (lines 85, 92,\n99, 104), returning the Python repr of the structure instead of the actual text. This is\nmisleading and makes it easy to abuse the API - callers receive strings like \"[{'type':\n'text', 'text': 'hi'}]\" and may not realize they're getting repr output rather than extracted\ntext. The function should be designed to make abuse hard: it should expect text-only content\nand either raise an exception or return None (with a return type like str | None) when called\non non-text content, forcing callers to handle structured content explicitly. The name and\ndocstring should also clarify that this is only for text-only messages.\n",
  should_flag: true,
}
