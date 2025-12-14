{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/reducer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/reducer.py': [
          {
            end_line: 52,
            start_line: 46,
          },
        ],
      },
      note: 'reduce_ui_state docstring lists all accepted event types with descriptions, duplicating the UiStateEvent union definition at line 33',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/models.py': [
          {
            end_line: 145,
            start_line: 135,
          },
        ],
      },
      note: 'Policy model docstring documents PolicyStatus enum states (ACTIVE/PROPOSED/REJECTED/SUPERSEDED) which should only exist on the PolicyStatus StrEnum definition',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Docstrings duplicate information already present in type system, creating\nmaintenance burden without adding information.\n\nProblems with redundant docstrings:\n- Create desync risk when types change\n- Duplicate maintenance (must update multiple locations)\n- Violate DRY principle\n- Add no information beyond type definitions\n\nCorrect approach: Document types at their definition sites. Functions/models\nusing those types should reference the type name, not duplicate its documentation.\n',
  should_flag: true,
}
