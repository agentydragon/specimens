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
            start_line: 96,
          },
          {
            end_line: 103,
            start_line: 101,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `create_global_compositor` function (lines 96-103 in compositor_factory.py)\ncatches mount errors and continues, creating inconsistent state where some agents\nare accessible and others silently aren't.\n\nLoop iterates `registry.known_agents()`, tries to mount each compositor, catches\n`Exception`, logs error, and continues. This creates: inconsistent state (some\nmounted, some not), silent failure (logged but system appears healthy), broken\ninvariants (registry knows agent but compositor doesn't expose it), 404s when\naccessing unmounted agents (no clear reason why), no recovery path without restart.\n\nMount failures indicate serious issues: database corruption, incomplete migration,\nunavailable resources, code bugs. These should prevent startup.\n\n**Fix:** Remove try/except. Let exceptions propagate; if mount fails, entire\n`create_global_compositor` fails, preventing management UI from starting. Fail-fast\nensures: clear failure (stack trace points to problem), consistent state (all or\nnone), debuggable, forces operator to fix underlying issue before running. Simpler\ncode, clearer system health indication.\n",
  should_flag: true,
}
