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
            end_line: 95,
            start_line: 93,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 93-95 catch exceptions when mounting agent compositors and continue\nsilently with logged error. This is dangerous initialization behavior.\n\n**Why this is wrong:**\n1. Silent failure: server starts but missing critical infrastructure\n2. Inconsistent state: some agents mounted, others missing\n3. No recovery path: failed agent is simply absent forever\n4. Violates fail-fast: better to crash loudly than fail silently\n5. Debugging nightmare: errors logged but system appears "healthy"\n\n**Mounting compositors is critical infrastructure.** If it fails, the server\nis misconfigured and should not start.\n\n**Fix:** Remove try/except entirely. Let exception propagate so server crashes\nduring startup, operator sees error immediately, and system never enters\npartially-broken state. Initialization failures should crash.\n\nIf partial mounting is truly needed (unlikely), requires explicit tracking,\nhealth checks, error APIs, recovery logic, and documentation.\n',
  should_flag: true,
}
