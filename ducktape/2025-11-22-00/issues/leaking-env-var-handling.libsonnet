{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/infrastructure.py',
        ],
        [
          'adgn/src/adgn/agent/presets.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/presets.py': [
          {
            end_line: 78,
            start_line: 59,
          },
        ],
        'adgn/src/adgn/agent/runtime/infrastructure.py': [
          {
            end_line: 142,
            start_line: 142,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Infrastructure code (infrastructure.py:142) manually reads\n`ADGN_AGENT_PRESETS_DIR` and passes it to `discover_presets()`, leaking\nimplementation details. The discovery function should read the env var\ninternally.\n\nProblems: breaks encapsulation (infrastructure knows preset internals),\nduplication risk (every caller must remember env var), hard to change\n(env var rename requires updating all callers), testing difficulty\n(must mock env var).\n\nFix: `discover_presets()` should accept `override_dir` parameter (testing\nonly) and read `ADGN_AGENT_PRESETS_DIR` internally when override not\nprovided. Production calls `discover_presets()`, tests pass `override_dir`.\n\nPrinciple: each module owns its environment variables. Compare with\n`resolve_runtime_image()` in images.py, which reads `ADGN_RUNTIME_IMAGE`\ninternally.\n',
  should_flag: true,
}
