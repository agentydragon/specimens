{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: null,
            start_line: 234,
          },
          {
            end_line: null,
            start_line: 251,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "AgentSession.agent_id (runtime.py:234,251) uses str | None, but AgentID is\nthe semantic identifier type used throughout codebase.\n\nUsing domain types provides:\n- Type safety: can't mix different ID types\n- Semantic clarity: not just any string, but specific identifier\n- No runtime conversions/validation\n- Clear type contracts in signatures\n",
  should_flag: true,
}
