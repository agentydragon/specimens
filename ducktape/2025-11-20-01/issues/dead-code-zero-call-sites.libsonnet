{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/openai_utils/model.py',
        ],
      ],
      files: {
        'adgn/src/adgn/openai_utils/model.py': [
          {
            end_line: 225,
            start_line: 219,
          },
        ],
      },
      note: 'AssistantMessageOut.from_input_item: converts AssistantMessage (input) back to AssistantMessageOut (output); reverse conversion never used',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/openai_utils/model.py',
        ],
      ],
      files: {
        'adgn/src/adgn/openai_utils/model.py': [
          {
            end_line: 281,
            start_line: 280,
          },
          {
            end_line: 253,
            start_line: 231,
          },
        ],
      },
      note: 'ResponsesResult.to_input_items and its only dependency response_out_item_to_input singledispatch; entire conversion-back path unused',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/policy_gateway/signals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/policy_gateway/signals.py': [
          {
            end_line: 145,
            start_line: 96,
          },
        ],
      },
      note: 'detect_policy_gateway_error: 50 lines of complex error detection logic, documented as unused at line 110',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Functions with zero call sites in the codebase should be deleted as dead code.\n\n**Benefits:**\n- Reduces maintenance burden\n- Eliminates confusion about unused code paths\n- Improves code readability by removing noise\n- Can always restore from git history if needed\n',
  should_flag: true,
}
