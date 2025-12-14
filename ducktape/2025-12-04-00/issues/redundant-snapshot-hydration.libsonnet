{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/gepa/gepa_adapter.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/gepa/gepa_adapter.py': [
          {
            end_line: 334,
            start_line: 308,
          },
          {
            end_line: null,
            start_line: 195,
          },
          {
            end_line: null,
            start_line: 256,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'GEPA optimization repeatedly hydrates the same snapshots, causing ~200 redundant tar extractions and file discoveries during a typical optimization run.\n\n**The inefficiency:**\n\nDataset loading (`load_datasets()`, lines 308-334) hydrates each snapshot once to extract metadata, then closes the hydrated context:\n\n```python\nasync with registry.load_and_hydrate(slug) as hydrated:\n    return SnapshotInput(slug=slug, target_files=..., ...)\n# Hydrated snapshot deleted here when context exits\n```\n\nDuring optimization, each evaluation re-hydrates from scratch (`_evaluate_one_specimen()`, line 195):\n\n```python\nasync def _evaluate_one_specimen(self, specimen_input: SnapshotInput, ...):\n    async with self.registry.load_and_hydrate(slug) as hydrated:\n        # Run critic with fresh hydration\n```\n\n**Performance impact:**\n\nWith 5-10 unique snapshots and max_metric_calls=200:\n- Initial loading: 5-10 hydrations (~5-10 seconds)\n- Optimization evaluations: ~200 hydrations (~200-400 seconds total)\n- Each hydration: tar extraction, JSON parsing, file discovery (~1-2 seconds)\n- Same snapshot hydrated 20-40 times throughout the run\n\n**Why this matters:**\n\nSnapshots are mounted read-only to Docker containers, so the hydrated directories could be reused safely. The issue is architectural:\n- `SnapshotInput` stores only metadata (slug, target_files list, ground truth issues)\n- `HydratedSnapshot` objects are created and destroyed per-evaluation\n- No mechanism to keep snapshots hydrated throughout the GEPA run\n\n**Potential fix:**\n\nKeep `HydratedSnapshot` objects alive throughout GEPA optimization:\n- Load and hydrate snapshots once at start\n- Pass `HydratedSnapshot` references through the evaluation pipeline (not just metadata)\n- Reuse the same hydrated directories for all critic/grader runs\n- Clean up only at the end of GEPA run\n\nThis would reduce ~200 hydrations to ~10, saving 3-6 minutes per optimization run.\n',
  should_flag: true,
}
