{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/cli.py': [
          {
            end_line: 90,
            start_line: 88,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The code initializes policy_source to None and then conditionally assigns a value.\nThis should use a ternary operator for conciseness.\n\n**Current code (lines 88-90):**\n```python\npolicy_source = None\nif initial_policy:\n    policy_source = initial_policy.read_text()\n```\n\n**Should be:**\n```python\npolicy_source = initial_policy.read_text() if initial_policy else None\n```\n\n**Why ternary is better:**\n- One line instead of three\n- More concise and readable\n- Clearly expresses the conditional assignment pattern\n- Standard Python idiom for simple conditional values\n- Easier to see both branches at once\n\n**Pattern applicability:**\nThis is a classic ternary operator use case: simple conditional assignment where\none branch has a value and the other is None (or another default).\n\n**Type safety:**\nBoth versions correctly type as `str | None`. The ternary makes the two possible\nvalues (read_text() result or None) more visually apparent.\n',
  should_flag: true,
}
