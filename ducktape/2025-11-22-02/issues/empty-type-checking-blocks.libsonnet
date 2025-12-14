{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: 44,
            start_line: 43,
          },
        ],
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 32,
            start_line: 31,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Two files contain TYPE_CHECKING blocks that only contain `pass`, serving no purpose:\n\n```python\nif TYPE_CHECKING:\n    pass\n```\n\nTYPE_CHECKING blocks exist to enable type-only imports that avoid circular dependencies at runtime. A typical use looks like:\n```python\nif TYPE_CHECKING:\n    from module import TypeOnlyNeeded\n```\n\nEmpty TYPE_CHECKING blocks with only `pass` are dead code - they add noise without providing any functionality. They may have been placeholders that were never filled in, or had imports removed without deleting the block itself.\n\n**Fix:**\nDelete both empty TYPE_CHECKING blocks:\n- adgn/src/adgn/agent/approvals.py lines 31-32\n- adgn/src/adgn/agent/agent.py lines 43-44\n\nIf type-only imports are needed in the future, they can be added back with actual imports. These empty blocks provide no value.\n',
  should_flag: true,
}
