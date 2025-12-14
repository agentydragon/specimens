{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/state.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 30,
            start_line: 30,
          },
          {
            end_line: 609,
            start_line: 609,
          },
        ],
        'adgn/src/adgn/agent/server/state.py': [
          {
            end_line: 41,
            start_line: 41,
          },
          {
            end_line: 73,
            start_line: 73,
          },
          {
            end_line: 130,
            start_line: 130,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 41 defines `ApprovalKind = UserApprovalDecision` type alias. Used in state.py:73,\nstate.py:130, servers/agents.py:30, servers/agents.py:609.\n\nAlias adds no semantic value: doesn't convey anything different from UserApprovalDecision,\nadds indirection (readers must look up), inconsistent naming (actual type has different\nname), not a true abstraction (1:1 with no behavior), import clutter.\n\nFix: remove alias (line 41), replace all usages with `UserApprovalDecision` directly.\nBenefits: one canonical name, clearer code, less cognitive overhead, easier to search/refactor.\n",
  should_flag: true,
}
