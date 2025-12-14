{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 182,
            start_line: 179,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 179-182 have inline imports with comment claiming "circular dependency with registry setup", but no circular dependency exists. Investigation shows mcp_bridge modules do NOT import from app.py.\n\nMove imports to top of file (standard import organization), delete misleading comment, remove noqa PLC0415 suppressions. If a circular dependency actually existed, the correct fix would be architecture refactoring, not hidden inline imports.\n',
  should_flag: true,
}
