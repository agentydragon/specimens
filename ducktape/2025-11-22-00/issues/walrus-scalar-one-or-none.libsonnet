{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: 264,
            start_line: 263,
          },
          {
            end_line: 402,
            start_line: 401,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Code uses assign-then-check pattern with `.scalar_one_or_none()` where walrus\noperator (:=) would be more concise.\n\n**Pattern:**\n```python\npolicy = result.scalar_one_or_none()\nif not policy:\n    return None\n# use policy\n```\n\nThis assign-then-check pattern appears in multiple SQLAlchemy query methods.\n\n**Correct approach using walrus operator:**\n```python\nif not (policy := result.scalar_one_or_none()):\n    return None\n# use policy\n```\n\n**Benefits:**\n- More concise (combines assignment and check)\n- Clearer scope (variable exists only where needed)\n- Standard Python 3.8+ idiom for "get and check" patterns\n- Reduces one-off temporary variables\n',
  should_flag: true,
}
