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
            end_line: 103,
            start_line: 95,
          },
          {
            end_line: 130,
            start_line: 113,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 95-103 in `create_global_compositor` duplicate the mounting logic from\n`mount_agent_compositor_dynamically` (lines 113-130).\n\nBoth do: create agent compositor, mount at `f\"agent{agent_id}\"`, log. Startup version\n(95-103) wraps in try/except to continue on failure. Dynamic version (113-130) doesn't.\n\nProblems: maintenance burden (sync changes), inconsistency risk (logic drift), different\nerror handling (startup suppresses, dynamic doesn't), different logging messages.\n\nFix: call `mount_agent_compositor_dynamically` in the startup loop. Remove try/except\n(see issue 003 for fail-fast rationale). Benefits: single source of truth, consistent\nbehavior, less code, uniform error handling.\n",
  should_flag: true,
}
