{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/compositor_factory.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/compositor_factory.py': [
          {
            end_line: 50,
            start_line: 47,
          },
          {
            end_line: 59,
            start_line: 52,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `create_agent_compositor` function creates intermediate variables `policy_server`\n(line 48) and `approvals_server` (lines 53-57) that are used exactly once in the\nimmediately following `mount_inproc()` call. These add no clarity and should be inlined.\n\nProblems: (1) Unnecessary binding - variables never referenced again. (2) Name pollution -\nadd no semantic value. (3) Cognitive load - reader tracks "what is this for?". (4) Not\nused in logging or error handling. (5) False complexity - suggests variable might be\nused later.\n\nWhy they exist: Likely habit from longer functions where variables were reused, possibly\nfor debugging (but not used in logging), or copy-pasted from code where needed.\n\nInline the constructors directly into `mount_inproc()` calls. Server types are clear from\nclass names, construction is straightforward, and values are used once. Python idiom\nencourages inline construction for single-use values.\n',
  should_flag: true,
}
