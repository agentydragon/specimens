{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_mcp_notifications_flow.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_mcp_notifications_flow.py': [
          {
            end_line: 147,
            start_line: 136,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 136-147: Complex 12-line assertion with nested loops, boolean flag,\nand break statements should be replaced with declarative hamcrest matcher.\n\n**What it checks:**\ncaptured[-1].input contains a UserMessage with content containing InputTextPart\nwhere text includes "<system notification>".\n\n**Current approach:** Imperative loops with mutable found flag, manual\nisinstance checks, nested breaks.\n\n**Should use:** Hamcrest matchers like has_properties, instance_of, and\ncontains_string to express the same check declaratively.\n\n**Benefits:** Declarative vs imperative, no manual loops/flags/breaks, better\nerror messages (hamcrest shows diffs), more readable, consistent with other\ntests, eliminates mutable state.\n',
  should_flag: true,
}
