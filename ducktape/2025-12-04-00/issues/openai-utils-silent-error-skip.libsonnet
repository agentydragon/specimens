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
            end_line: 281,
            start_line: 281,
          },
          {
            end_line: 293,
            start_line: 292,
          },
          {
            end_line: 332,
            start_line: 330,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `_message_output_to_assistant` function (lines 281-294) returns `AssistantMessageOut | None`, and when it returns None (lines 292-293), the caller (lines 330-332) silently skips adding the item to `out_items`.\n\nThis is dangerous for two reasons:\n\n1. **OpenAI reasoning sensitivity**: OpenAI's reasoning feature is sensitive to being placed in exactly the same prefix it was sampled from. Silently dropping messages breaks this invariant and can cause subtle bugs.\n\n2. **Silent error hiding**: If `_message_output_to_assistant` returns None because something went wrong (no parts found), this should be treated as an error that surfaces immediately, not silently ignored.\n\nThe function should be changed to either:\n- Return a non-nullable `AssistantMessageOut` and raise an exception when parts is empty, OR\n- Have the caller raise an exception when None is returned instead of silently skipping\n\nErrors must cause breakage/raise, not be silently skipped.\n",
  should_flag: true,
}
