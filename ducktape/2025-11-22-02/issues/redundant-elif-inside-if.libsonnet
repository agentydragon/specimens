{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 267,
            start_line: 264,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Confusing \"elif live:\" inside \"if infra:\" block (lines 264-267):\n```python\nif infra:\n    # Get pending approvals count\n    pending_approvals = len(infra.approval_hub.pending)\n\n    # Derive run phase\n    if pending_approvals > 0:\n        run_phase = RunPhase.WAITING_APPROVAL\n    elif live:  # <-- CONFUSING!\n        run_phase = RunPhase.SAMPLING\n```\n\nThe `elif live:` appears inside `if infra:`, but `live = infra is not None`.\nIf we're inside the `if infra:` block, then `live` is always True, making the\nelif test redundant and confusing.\n\nShould flatten the logic:\n```python\nif not infra:\n    run_phase = RunPhase.IDLE\n    pending_approvals = 0\nelif (pending_approvals := len(infra.approval_hub.pending)) > 0:\n    run_phase = RunPhase.WAITING_APPROVAL\nelse:\n    run_phase = RunPhase.SAMPLING\n```\n",
  should_flag: true,
}
