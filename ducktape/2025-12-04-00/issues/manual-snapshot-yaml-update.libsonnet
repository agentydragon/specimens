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
            end_line: 363,
            start_line: 335,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `cmd_build_bundle` function (lines 335-363) uses pygit2 to create filtered\ncommits and tags for snapshot bundles, but doesn't return the mapping of tag names\nto commit SHAs that it creates. The function has no return value.\n\nThis forces callers to either:\n1. Write placeholder commit SHAs and manually update them later\n2. Query the bundle post-hoc using `git bundle list-heads`\n\nThe function calls `_build_bundle_internal` which creates the commits and tags.\nThat commit information should be captured and returned to callers for automatic\nsnapshots.yaml updates.\n",
  should_flag: true,
}
