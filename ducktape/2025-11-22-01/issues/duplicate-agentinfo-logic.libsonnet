{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/registry_bridge.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/registry_bridge.py': [
          {
            end_line: 100,
            start_line: 67,
          },
          {
            end_line: 135,
            start_line: 108,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 67-100 (`list_agents`) and 108-135 (`get_agent_info`) duplicate identical logic\nfor computing AgentInfo from registry state.\n\nDuplicated sequence: get mode, get infrastructure, compute live status, initialize\npending_approvals/run_phase, conditionally count approvals and derive run_phase,\ncompute is_local, construct AgentInfo.\n\nOnly difference: error handling (list_agents continues on KeyError, get_agent_info\nraises with message).\n\nFix: extract `_compute_agent_info(agent_id) -> AgentInfo` helper that does the\ncomputation. Simplify both handlers to call the helper with appropriate error handling.\n\nBenefits: single source of truth, easier testing, reusable, clearer separation.\n',
  should_flag: true,
}
