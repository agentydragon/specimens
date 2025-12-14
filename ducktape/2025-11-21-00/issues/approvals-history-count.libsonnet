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
            end_line: 168,
            start_line: 168,
          },
          {
            end_line: 450,
            start_line: 446,
          },
          {
            end_line: 447,
            start_line: 447,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 162-168 define AgentApprovalsHistory with a redundant `count` field that's\ntrivially computable from the `timeline` and `pending` lists already in the response\n(count = len(timeline) + len(pending)). Lines 446-450 compute and construct this\nredundant field.\n\nProblems: Trivially computable by clients in one line, redundant information wastes\nbandwidth, inconsistency risk if lists are modified or computation has bugs, violates\nsingle source of truth (data in lists, count is derived), makes tests more brittle\n(must verify count matches lengths).\n\nRemove count field from model and construction. Clients compute it when needed.\nBenefits: eliminates redundant data, smaller payloads, no sync risk, simpler model,\nencourages lazy evaluation, one less field to maintain and test.\n",
  should_flag: true,
}
