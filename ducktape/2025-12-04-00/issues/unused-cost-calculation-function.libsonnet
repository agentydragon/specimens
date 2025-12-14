{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/openai_utils/cost.py',
        ],
      ],
      files: {
        'adgn/src/adgn/openai_utils/cost.py': [
          {
            end_line: 41,
            start_line: 13,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `calculate_cost()` function in `cost.py` duplicates logic that already exists in the database `run_costs` view and is never called.\n\nAll cost calculations in the codebase are performed by the database view (defined in `src/adgn/props/db/models.py:588-636`), which:\n- Aggregates token usage from the `events` table\n- Joins with `model_pricing` table for current rates\n- Computes costs using the same formula as this function\n- Is queried by `BudgetEnforcementHandler` via `po_run_costs()` query builder\n\nThe Python function has no callers anywhere in the codebase. It appears to be either early prototype code that was superseded by the database approach, or documentation/reference code that was never meant to be called.\n\nKeeping both implementations creates:\n- Duplication risk: changes to pricing logic must be made in two places\n- Inconsistency risk: implementations could drift apart\n- Maintenance burden: extra file to maintain and understand\n\nThe database view is the single source of truth and should remain so.\n',
  should_flag: true,
}
