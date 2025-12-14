{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: 1176,
            start_line: 1172,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Code guards debug logs with `if self.debug: ... logger.debug(...)`. Prefer leaving configuration to the logger:\nemit `logger.debug(...)` unconditionally and let handler levels/filters handle it. Guard only expensive\nformatting when necessary (or use logger.isEnabledFor(logging.DEBUG)). This keeps config centralized and\nremoves redundant conditionals at call sites.\n',
  should_flag: true,
}
