{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/cmd_build_bundle.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/cmd_build_bundle.py': [
          {
            end_line: 235,
            start_line: 224,
          },
        ],
      },
      note: 'Checks for bundle metadata twice - first at line 226 with dict.get(), then at line 233 with validated model',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/models.py': [
          {
            end_line: 305,
            start_line: 304,
          },
        ],
      },
      note: 'Checks both "ctx is None OR not isinstance(ctx, ...)" - isinstance already handles None',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: null,
            start_line: 87,
          },
        ],
      },
      note: 'Redundant isinstance check: "if not isinstance(call_id, str) or not call_id" - second condition is sufficient',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Redundant checks and guards that serve no purpose and can be removed. These include checking the same condition twice, redundant None checks with isinstance, and redundant type validation.\n',
  should_flag: true,
}
