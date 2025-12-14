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
            start_line: 57,
          },
        ],
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: null,
            start_line: 378,
          },
          {
            end_line: null,
            start_line: 389,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Run.id (models.py:57) uses Mapped[str] in model, but domain code uses UUID.\nCreates constant str(run_id) conversions (sqlite.py:378,389). SQLAlchemy\nsupports UUID types that handle serialization automatically.\n\nUsing domain types provides:\n- Type safety: can't mix different ID types\n- Semantic clarity: not just any string, but specific identifier\n- No runtime conversions/validation\n- Clear type contracts in signatures\n",
  should_flag: true,
}
