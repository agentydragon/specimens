{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/__init__.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/__init__.py': [
          {
            end_line: null,
            start_line: 188,
          },
          {
            end_line: null,
            start_line: 189,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 188-189 define policy persistence methods with unclear return types:\n`get_latest_policy` returns `tuple[str, int] | None` where tuple unpacking\nrequires remembering the order and the int's meaning (policy ID) is non-obvious.\n`set_policy` returns an undocumented int (the database-assigned policy ID).\n\nProblems: Tuple unpacking requires remembering element order, no semantic meaning\nto tuple positions, unclear what the int represents, requires checking None before\nunpacking, callers must know implementation details.\n\nReplace with a typed object (PolicyRecord or NamedTuple) containing id, content,\ntimestamp, and agent_id fields. This provides self-documenting field names,\ntype safety, IDE autocomplete, and clear semantics. Alternatively, at minimum\nadd docstring documenting what the int represents.\n",
  should_flag: true,
}
