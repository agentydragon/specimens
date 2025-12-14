{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 232,
            start_line: 230,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 230-232 in runtime.py use an imperative if-statement to conditionally assign\n`details`, when a ternary expression would be clearer and more concise.\n\n**Current pattern:**\n```\ndetails = None\nif (condition):\n    details = SnapshotDetails(...)\n```\n\n**Better:** Use ternary operator for conditional assignment:\n```\ndetails = SnapshotDetails(...) if condition else None\n```\n\nThis is more concise and clearly expresses that `details` is conditionally assigned\nbased on a single condition.\n',
  should_flag: true,
}
