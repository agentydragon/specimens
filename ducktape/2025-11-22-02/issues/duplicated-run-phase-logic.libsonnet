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
            start_line: 255,
          },
          {
            end_line: 304,
            start_line: 296,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Run phase determination logic is duplicated across `list_agents()` resource\n(lines 255-267) and `get_agent_info()` resource (lines 296-304).\n\nBoth compute run phase and pending approvals count using identical logic:\ncheck if infra exists, count pending approvals, decide between IDLE/WAITING_APPROVAL/SAMPLING.\n\nShould extract a helper method:\n```python\ndef _determine_run_phase(\n    self, infra: RunningInfrastructure | None\n) -> tuple[RunPhase, int]:\n    """Determine run phase and pending approvals count."""\n    if not infra:\n        return RunPhase.IDLE, 0\n\n    pending_approvals = len(infra.approval_hub.pending)\n    if pending_approvals > 0:\n        return RunPhase.WAITING_APPROVAL, pending_approvals\n    else:\n        return RunPhase.SAMPLING, pending_approvals\n```\n\nThen call it: `run_phase, pending_approvals = self._determine_run_phase(infra)`\n',
  should_flag: true,
}
