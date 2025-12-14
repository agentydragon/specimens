{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/local_runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/local_runtime.py': [
          {
            end_line: 82,
            start_line: 81,
          },
          {
            end_line: 88,
            start_line: 85,
          },
          {
            end_line: 153,
            start_line: 90,
          },
          {
            end_line: 158,
            start_line: 155,
          },
          {
            end_line: 165,
            start_line: 160,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "`LocalAgentRuntime` has lifecycle issues: missing type annotations\n(ui_bus, connection_manager at 81-82), \"may be initialized\" antipattern\n(session/agent nullable at 85-88, runtime checks at 155-158), incomplete\ncleanup (close() doesn't null fields at 160-165), and not being a proper\ncontext manager despite having start()/close() methods.\n\n\"May be initialized\" antipattern impact: object exists but isn't usable\n(half-initialized), every method must check initialization, type system\ncan't help (fields are `T | None`), easy to forget start() call.\n\nSolutions: (1) async context manager (move start() logic to __aenter__,\ncleanup to __aexit__, automatic lifecycle, strong types, guaranteed\ncleanup), or (2) factory pattern (classmethod create() with async init,\nmanual lifecycle but strong types).\n\nCurrent approach: manual unclear lifecycle, weak type safety, incomplete\ncleanup.\n",
  should_flag: true,
}
