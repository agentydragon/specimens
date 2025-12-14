{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/models.py',
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/models.py': [
          {
            end_line: null,
            start_line: 70,
          },
        ],
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: null,
            start_line: 131,
          },
          {
            end_line: null,
            start_line: 147,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Agent.id (models.py:70) uses Mapped[str], but code wraps with AgentID() at\nruntime (sqlite.py:131,147). If SQLAlchemy supports NewType, should declare\nas AgentID to eliminate runtime wrappers.\n\nUsing domain types provides:\n- Type safety: can't mix different ID types\n- Semantic clarity: not just any string, but specific identifier\n- No runtime conversions/validation\n- Clear type contracts in signatures\n",
  should_flag: true,
}
