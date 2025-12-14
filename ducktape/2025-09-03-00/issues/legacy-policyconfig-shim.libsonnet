{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/wrapper.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/wrapper.py': [
          {
            end_line: 27,
            start_line: 23,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The wrapper contains a legacy PolicyConfig shim that exists only for import compatibility with older tests.\nKeeping dead shims because "tests still reference it" is not a sufficient reason to retain the code: tests should be updated to the canonical model or provided a test-only shim.\n\nWhy this is bad:\n- It preserves dead/unused code paths that increase maintenance burden and cognitive load.\n- New readers assume the shim is live behavior and may write code to support it, increasing cruft.\n- Tests depending on obsolete shims should be migrated or wrapped in explicit test fixtures rather than perpetuating legacy surface area.\n',
  should_flag: true,
}
