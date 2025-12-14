{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
        [
          'adgn/src/adgn/agent/persist/__init__.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 178,
            start_line: 171,
          },
          {
            end_line: 473,
            start_line: 464,
          },
          {
            end_line: 470,
            start_line: 470,
          },
          {
            end_line: 477,
            start_line: 475,
          },
        ],
        'adgn/src/adgn/agent/persist/__init__.py': [
          {
            end_line: 87,
            start_line: 82,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 171-178 define `PolicyProposalInfo` with fields `id`, `status`, `created_at`, `decided_at`,\nand `proposal_uri`. Lines 464-473 convert `PolicyProposal` objects from persistence (persist/__init__.py:82-87,\n5 fields including `content`) to `PolicyProposalInfo`, copying 4 fields and adding computed\n`proposal_uri` via f-string.\n\nThis is unnecessary indirection: `PolicyProposalInfo` is just `PolicyProposal` minus `content`\nfield plus computable URI. Creates two types representing proposals (persistence vs API), requires\nmanual conversion copying fields, and manual URI construction with f-string.\n\nDelete `PolicyProposalInfo` class (lines 171-178) and return `list[PolicyProposal]` directly from\n`agent_policy_proposals()`. Update `AgentPolicyProposals.proposals` type from `list[PolicyProposalInfo]`\nto `list[PolicyProposal]`. Eliminates wrapper, conversion loop (lines 464-473), and establishes\nsingle source of truth.\n',
  should_flag: true,
}
