{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 146,
            start_line: 144,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `state_uri`, `approvals_uri`, and `policy_proposals_uri` fields in `AgentInfo` (lines 144-146)\ncan always be computed from `agent_id`. They should not be in the Pydantic model as they add no\ninformation and create unnecessary redundancy.\n\nURIs follow deterministic patterns: `resource://agents/{agent_id}/policy/state`,\n`resource://agents/{agent_id}/approvals/history`, `resource://agents/{agent_id}/policy/proposals`.\nClient can easily construct given agent_id.\n\nProblems: (1) Storing precomputed derivable values violates DRY, creates maintenance burden.\n(2) If URI patterns change, must update both construction logic AND field values. (3) All three\nare `str | None = None`, but could always be computed - `None` default misleadingly suggests\nsometimes unavailable. (4) Fields appear defined but not populated anywhere (no assignments\nfound), dead weight. (5) Bloats response payloads with redundant URIs.\n\nFix: Remove all three URI fields from AgentInfo. If clients need URIs, construct client-side\nfrom `agent_id` using helper, or use separate endpoint. Alternative: `@property` that computes\non-demand, but removing entirely is preferred.\n\nBenefits: Single source of truth for URI patterns, smaller cleaner model, no risk of stale URIs,\nless code to maintain, clearer URIs are derived not stored.\n',
  should_flag: true,
}
