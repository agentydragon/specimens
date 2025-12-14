{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
        [
          'adgn/src/adgn/mcp/_shared/constants.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 407,
            start_line: 407,
          },
        ],
        'adgn/src/adgn/mcp/_shared/constants.py': [
          {
            end_line: 60,
            start_line: 57,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 407 in agents.py manually constructs a resource URI using an f-string\ninstead of using a centralized constant from _shared/constants.py. The codebase\nhas URI format constants (e.g., AGENTS_APPROVALS_PENDING_URI_FMT) but individual\napproval URIs are constructed inline.\n\n**Problems:**\n- Violates centralization principle (constants.py exists for this)\n- Inconsistent with rest of codebase which imports URI constants\n- Hard to change URI patterns globally\n- Risk of typos in manual construction\n- No single source of truth for URI patterns\n\n**Fix:** Add AGENTS_APPROVAL_URI_FMT constant to constants.py, then import and\nuse it: `AGENTS_APPROVAL_URI_FMT.format(agent_id=..., call_id=...)`. This pattern\nshould apply to all manual URI constructions in the codebase.\n',
  should_flag: true,
}
