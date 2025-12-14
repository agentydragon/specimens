{
  occurrences: [
    {
      expect_caught_from: [
        [
          'pyright_watch_report.py',
        ],
      ],
      files: {
        'pyright_watch_report.py': [
          {
            end_line: null,
            start_line: 12,
          },
          {
            end_line: null,
            start_line: 46,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "If `load_config` is run with explicit `--config=<file>`, it will *silently skip it* if it's broken and instead potentially use other autodiscovered candidates, which (A) *discards user intent* despite the *explicit flags*, and (B) does so *silently*, without announcing any kind of error.\n\n`load_config` does:\n\n```python\ncandidates: list[Path] = []\nif config_path:\n    candidates.append(config_path)  # <- from explicit commandline arg\n# ... add other candidates ...\nfor cand in candidates:\n  if cand.is_file():\n      try:\n          return cand, json.loads(cand.read_text())\n      except Exception:\n          pass\n```\n\nIf user explicitly sets `--config` and it fails to load, this silently skips it and moves on to other candidates, explicitly *and silently* violating user intent.\n\nIf explicitly provided `--config` is not present or fails to load, code must fail fast and surface the error.\nFallback discovery as in specimen would only be acceptable as \"friendly default\" when no explicit `--config` passed.\n(Motivating scary example: imagine a PII-holding server, with `--config=explicit_config.json`, `explicit_config.json` having `{\"dangerous_pii_exposing_debug_switch\"=false}` (type) and silently discovered fallback `random_debug_developer_config.json` setting it to `true`).\n",
  should_flag: true,
}
