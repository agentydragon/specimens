{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 60,
            start_line: 58,
          },
          {
            end_line: 266,
            start_line: 266,
          },
          {
            end_line: 267,
            start_line: 267,
          },
          {
            end_line: 270,
            start_line: 268,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 58-60 define `AgentStatus` which inherits from `AgentStatusCore` but adds nothing (no fields, methods, or config). Pure noop wrapper.\n\nUsed at lines 266-267 for response model/return type, and line 270 performs unnecessary conversion (`AgentStatus(**core.model_dump(mode="json"))`).\n\nDelete the class entirely. Replace all uses with `AgentStatusCore`. Simplify lines 268-270 to just `return await build_agent_status_core(app, agent_id)`. Keep `build_agent_status_core` as shared function (used in 2 places).\n',
  should_flag: true,
}
