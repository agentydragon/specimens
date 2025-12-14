{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/local_tools.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/local_tools.py': [
          {
            end_line: 43,
            start_line: 28,
          },
          {
            end_line: 90,
            start_line: 50,
          },
          {
            end_line: 127,
            start_line: 110,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'exec_handler converts timeout_ms to seconds early with int(timeout_ms / 1000), truncating\nsub-second precision (1500ms becomes 1s, 500ms becomes 0→1s). Timeout should be propagated\nas milliseconds (int) throughout the call chain and only divided by 1000.0 at the final\nsubprocess.communicate() call. This requires changing: exec_handler to pass timeout_ms\ndirectly, _run_in_sandbox(timeout_s: int) → _run_in_sandbox(timeout_ms: int),\n_run_proc(timeout_s: int) → _run_proc(timeout_ms: int), and _run_proc to convert at\ncommunicate: p.communicate(timeout=timeout_ms / 1000.0). Python >=3.11 is required\nand subprocess.communicate() has supported float timeout since Python 3.3.\n',
  should_flag: true,
}
