{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py': [
          {
            end_line: 183,
            start_line: 181,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The timeout branch is a literal no-op:\n\n  if timed_out:\n    # We cannot reliably kill the exec unless wrapper handled it; return best-effort\n    pass\n\nTimeout handling in this module:\n- With USE_CONTAINER_TIMEOUT_WRAPPER=1, commands are wrapped in `timeout -s TERM <secs>` inside the container (see lines 27–31), so the process is actually signaled on expiry.\n- Without the wrapper, we stop reading and return ExecResult with `timed_out=True`, but the container process may keep running. Tests only assert `timed_out`; they do not verify termination.\n\nThis is a footgun: timeouts can exceed and leave processes running. At the very least, document this behavior prominently and surface explicit return markers (e.g., `timeout_enforced=false` or `kill_attempted=false`) so callers can react.\n\nPreferred fix: require an always-correct timeout path. If a timeout is requested and the wrapper is unavailable, fail fast (refuse to run) instead of best-effort; or ensure the implementation enforces termination reliably. Delete the empty branch.\n',
  should_flag: true,
}
