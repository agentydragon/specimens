{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/approval_policy/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/approval_policy/server.py': [
          {
            end_line: 167,
            start_line: 165,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `proposal_detail` resource handler should use the walrus operator (`:=`) to combine\nthe assignment and None check of the `got` variable into a single expression.\n\n**Current code (lines 165-167):**\n```python\ngot = await self._engine.persistence.get_policy_proposal(self._engine.agent_id, id)\nif got is None:\n    raise KeyError(id)\n```\n\n**Why this should be improved:**\n- The pattern \"assign, then immediately check for None\" is verbose\n- Python 3.8+ walrus operator allows combining assignment with conditional\n- Reduces visual noise and makes the None-check pattern more obvious\n- Common Python idiom for this pattern\n\n**Recommended fix:**\nUse walrus operator to combine assignment and check:\n```python\nif (got := await self._engine.persistence.get_policy_proposal(self._engine.agent_id, id)) is None:\n    raise KeyError(id)\n```\n\n**Benefits:**\n- More concise (3 lines → 2 lines)\n- Emphasizes that this is a \"fetch-or-error\" pattern\n- Eliminates the gap between assignment and usage\n- Modern Python idiom widely used in the codebase\n\n**Note:**\nThis is a simple readability improvement that doesn't change behavior.\n",
  should_flag: true,
}
