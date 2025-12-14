{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py',
          'adgn/docs/llm/sandboxer/JUPYTER_CONFIG_STRATEGY.md',
        ],
      ],
      files: {
        'adgn/docs/llm/sandboxer/JUPYTER_CONFIG_STRATEGY.md': [
          {
            end_line: 6,
            start_line: 6,
          },
        ],
        'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py': [
          {
            end_line: 114,
            start_line: 111,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "JUPYTER_CONFIG_STRATEGY.md specifies that JUPYTER_RUNTIME_DIR should be set to\n<run_root>/runtime (line 6), but launch.py's child_env (lines 111-114) only sets\nJUPYTER_PATH, JUPYTER_DATA_DIR, and JUPYTER_CONFIG_DIR, omitting JUPYTER_RUNTIME_DIR\nentirely. Without JUPYTER_RUNTIME_DIR set, Jupyter uses its default location:\njupyter_data_dir() + \"/runtime\" (per jupyter_core/paths.py). Since child_env sets\nJUPYTER_DATA_DIR to <run_root>/data, Jupyter will use <run_root>/data/runtime for its\nruntime directory, not <run_root>/runtime as documented. This means jpserver-<pid>.json\nfiles (which contain server URL/token info) are written to <run_root>/data/runtime instead\nof <run_root>/runtime.\n",
  should_flag: true,
}
