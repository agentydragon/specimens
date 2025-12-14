{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/policy_eval/container.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/policy_eval/container.py': [
          {
            end_line: 52,
            start_line: 52,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Unnecessary intermediate variable for dict that's used only once, combined with\nmanual dict construction from Pydantic model instead of using `model_dump()`.\n\n**Current code (container.py:52):**\n```python\npayload = {\"name\": policy_input.name, \"arguments\": policy_input.arguments}\n# ... later used once\n```\n\nTwo problems:\n1. `payload` variable is only used once (no benefit to naming it)\n2. Manually constructing dict from Pydantic model fields instead of `model_dump()`\n\n**Correct approach:**\n\nInline and use `model_dump()` with field selection:\n```python\n# Inline directly where used\n... policy_input.model_dump(include={\"name\", \"arguments\"}) ...\n```\n\n**Benefits:**\n- One fewer variable\n- Pydantic handles serialization (respects aliases, validators, etc.)\n- More maintainable (if model fields change, dump adapts)\n- Explicit about which fields are serialized\n",
  should_flag: true,
}
