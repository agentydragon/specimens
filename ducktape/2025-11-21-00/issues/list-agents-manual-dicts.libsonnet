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
            end_line: 312,
            start_line: 261,
          },
          {
            end_line: 310,
            start_line: 300,
          },
          {
            end_line: 312,
            start_line: 312,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 270-312 manually construct dict objects with 7 fields (id, mode, live, active_run_id,\nrun_phase, pending_approvals, capabilities) and serialize via `json.dumps()`, returning `str`.\n\nManual dict construction loses: (1) type safety (typos in field names uncaught), (2) validation\n(wrong types or missing fields undetected), (3) IDE support (no autocomplete), (4) self-documentation\n(schema not explicit).\n\nThe rest of the codebase uses Pydantic models for structured responses (e.g., `AgentInfo`,\n`AgentList`, `AgentApprovalsHistory`). This function is an outlier.\n\nReplace manual dict construction with Pydantic models: define `AgentListItem(BaseModel)` with the\n7 fields, return `AgentsList(agents: list[AgentListItem])` instead of `str`, and remove the manual\n`json.dumps()` call (let the framework handle serialization).\n',
  should_flag: true,
}
