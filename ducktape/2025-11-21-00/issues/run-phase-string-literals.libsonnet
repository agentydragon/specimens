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
            end_line: 294,
            start_line: 284,
          },
          {
            end_line: 284,
            start_line: 284,
          },
          {
            end_line: 292,
            start_line: 292,
          },
          {
            end_line: 294,
            start_line: 294,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 284-294 assign `run_phase` using string literals (\"idle\", \"waiting_approval\",\n\"sampling\") instead of a proper enum, losing type safety and enabling typos.\n\nProblems: No type safety (typos like \"wating_approval\" won't be caught), no\nexhaustiveness checking, no IDE autocomplete, magic strings scattered across code,\nhard to discover valid values, inconsistent with other status fields (AgentMode,\nServerStatus, ProposalStatus, etc. use enums).\n\nDefine a RunPhase StrEnum with IDLE/WAITING_APPROVAL/SAMPLING values and use it\nthroughout. Update the Pydantic model to type run_phase as RunPhase instead of str.\nBenefits: type-safe phase values, IDE autocomplete, single source of truth,\nself-documenting, consistent with codebase patterns, easier refactoring, validation\nat Pydantic boundary.\n",
  should_flag: true,
}
