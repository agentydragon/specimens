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
            end_line: 656,
            start_line: 626,
          },
          {
            end_line: 448,
            start_line: 431,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `.messages` property (lines 626-656) is a thin wrapper around `_to_openai_input_items()` (lines 431-448).\nThese should be merged into a single public method named `.to_openai_messages()` for clarity. Using a\nmethod name instead of a property better signals that this performs a non-trivial conversion (creating\na new list with transformed items) rather than just accessing state. The \"to_\" prefix explicitly indicates\nthis converts to an external format (OpenAI's), not our internal format.\n",
  should_flag: true,
}
