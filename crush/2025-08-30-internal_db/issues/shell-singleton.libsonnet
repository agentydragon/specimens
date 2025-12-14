{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/shell/persistent.go',
        ],
        [
          'internal/llm/tools/bash.go',
        ],
      ],
      files: {
        'internal/llm/tools/bash.go': [
          {
            end_line: 322,
            start_line: 314,
          },
        ],
        'internal/shell/persistent.go': [
          {
            end_line: 36,
            start_line: 13,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Global PersistentShell singleton breaks session isolation and creates hard-to-reason-about shared state.\n\nSummary\n- A process‑wide singleton shell (sync.Once) carries cwd/env/blockers across tool runs.\n- New callers mutate the same global instance (SetWorkingDir, SetBlockFuncs), so one session's state leaks into another.\n- This design prevents per‑session invariants and makes concurrency behavior unpredictable.\n\nRisks\n- Cross‑session leakage of working directory and environment.\n- Order‑dependent and racy behavior when multiple sessions/tools run concurrently.\n- Tests and real sessions can interfere with each other via shared global state.\n\nAcceptance criteria\n- Remove the global singleton; inject a per‑session Shell (or factory) via dependencies.\n- Tools (e.g., Bash) receive their own shell instance; no package‑level mutable state.\n- Concurrency tests demonstrate isolation (no shared cwd/env/blockers across sessions).\n",
  should_flag: true,
}
