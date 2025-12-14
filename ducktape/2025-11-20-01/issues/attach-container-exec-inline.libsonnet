{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/runtime/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/runtime/server.py': [
          {
            end_line: 22,
            start_line: 22,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '`attach_container_exec` has only one call site (runtime/server.py line 22) and is a\ntrivial wrapper that just forwards parameters. This function should be inlined directly\ninto its only caller to reduce indirection and simplify the code. The function body is\na single await statement with parameter forwarding - no logic to justify the abstraction.\n',
  should_flag: true,
}
