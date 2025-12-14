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
            end_line: 178,
            start_line: 178,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 178 defines `PolicyProposalInfo` with a `proposal_uri` field that is trivially computable\nfrom the `id` field via `f"{APPROVAL_POLICY_PROPOSALS_INDEX_URI}/{id}"`.\n\nThis creates redundancy and inconsistency risk: storing both `id` and `proposal_uri` violates\nDRY when one is derivable from the other. If the URI pattern changes, both the construction\nlogic and this field must be updated. The field also bloats response payloads when listing\nmany proposals.\n\nThe codebase uses IDs as primary identifiers elsewhere, not URIs. Mixing both creates\nconfusion about which is canonical.\n\nRemove `proposal_uri` field from the model; clients can construct URIs on-demand from IDs.\nBenefits: single source of truth, smaller payloads, no sync risk, consistency with ID-based\npatterns.\n',
  should_flag: true,
}
