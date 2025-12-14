{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: null,
            start_line: 719,
          },
          {
            end_line: null,
            start_line: 728,
          },
          {
            end_line: null,
            start_line: 733,
          },
          {
            end_line: null,
            start_line: 753,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 719 creates `include_all = args.stage_all`, then uses it throughout. This\nvariable adds no value - just use `args.stage_all` directly.\n\n**Occurrences of include_all:**\n- Line 719: Definition\n- Line 728: `_stage_all_if_requested(repo, include_all)`\n- Line 733: `get_commit_diff(repo, include_all, previous_message)`\n- Line 753: `build_cache_key(..., include_all=include_all, ...)`\n\n**Fix:** Delete line 719 and replace all `include_all` uses with `args.stage_all`.\n\n**Benefits:**\n1. Fewer variables to track\n2. Clear where the value comes from (args)\n3. One less line of code\n',
  should_flag: true,
}
