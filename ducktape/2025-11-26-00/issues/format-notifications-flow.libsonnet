{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/reducer.py',
        ],
        [
          'adgn/src/adgn/agent/server/mode_handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/reducer.py': [
          {
            end_line: 222,
            start_line: 218,
          },
        ],
        'adgn/src/adgn/agent/server/mode_handler.py': [
          {
            end_line: 39,
            start_line: 35,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The function creates an optional UserMessage, then checks if it's None. This is\nbackwards - we should decide whether to create a message first, then create it\nunconditionally.\n\n**Current flow (reducer.py:218-222, mode_handler.py:35-39):**\n1. Unconditionally call `format_notifications_message()` → returns `UserMessage | None`\n2. Check if result is None\n3. Log/handle accordingly\n\n**Problems:**\n- Creates optional message, then checks for None (backwards logic)\n- `msg` could be inlined into return if message were non-nullable\n- Logging happens at caller, not where we know how many notifications exist\n\n**Better flow:**\n1. Calculate total notifications count in caller\n2. Log count (or \"none\")\n3. If zero, return early\n4. Call `format_notifications_message()` → returns non-nullable `UserMessage`\n5. Inline into return\n\nThis makes `format_notifications_message` simpler (always returns message),\nmoves logging closer to data source, and enables inlining `msg`.\n\n**Alternative:** Use walrus operator: `if (msg := format_notifications...) is None:`\nBut the above refactor is cleaner overall.\n",
  should_flag: true,
}
