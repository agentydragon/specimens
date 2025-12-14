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
  rationale: 'The policy_source initialization uses two lines when it could be a single ternary expression:\n\n```python\npolicy_source = None\nif initial_policy:\n    policy_source = initial_policy.read_text()\n```\n\nThis is a simple conditional assignment - perfect for a ternary operator.\n\nReplace with ternary oneliner:\n\n```python\npolicy_source = initial_policy.read_text() if initial_policy else None\n```\n\nBenefits:\n- More concise (one line vs three)\n- Standard Python idiom for conditional assignment\n- Clearer intent (assigning based on condition)\n- Variable is const-assigned (not mutated)\n',
  should_flag: true,
}
