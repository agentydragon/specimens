{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/approvals_bridge.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/approvals_bridge.py': [
          {
            end_line: null,
            start_line: 38,
          },
          {
            end_line: null,
            start_line: 65,
          },
          {
            end_line: null,
            start_line: 80,
          },
          {
            end_line: null,
            start_line: 116,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `pending_count` field in `ApprovalsResponse` is redundant because it's derived\ninformation that can be computed from the already-returned `approvals` list by counting\nitems with `status == ApprovalStatus.PENDING`.\n\nCurrent implementation manually counts pending approvals while building the list:\n```python\npending_count = 0\n# ...\nfor call_id, tool_call in pending_map.items():\n    approvals_list.append(...)\n    pending_count += 1\n```\n\nThis violates DRY (Don't Repeat Yourself) - the client already has all the information\nneeded to compute pending_count from the approvals list.\n\nFix: Remove the `pending_count` and `decided_count` fields from `ApprovalsResponse`.\nClients can compute these values trivially:\n```python\npending_count = len([a for a in approvals if a.status == ApprovalStatus.PENDING])\ndecided_count = len([a for a in approvals if a.status != ApprovalStatus.PENDING])\n```\n\nThis simplifies the server code and reduces the chance of count/list mismatch bugs.\n",
  should_flag: true,
}
