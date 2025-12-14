{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/snapshot_registry.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/snapshot_registry.py': [
          {
            end_line: 393,
            start_line: 363,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The three branches in `_create_archive_from_git` (bundle files, file:// URLs, and\nremote URLs) execute nearly identical sequences of git operations. All paths end up\ndoing the same steps: initialize repository, configure remote, fetch ref, and checkout.\n\nThe branching logic appears to exist to handle bundle files specially and to use\nshallow clones (depth=1) for non-bundle sources. However, this complexity is\nunnecessary because:\n\n- The optimization of shallow clones is minimal value since these archives are\n  cached (one-time operation per commit) and the .git directory is immediately\n  deleted anyway\n- Modern git clone can handle all these cases uniformly (bundles, file://, https://)\n  without manual init+fetch+checkout steps\n- The duplicated code makes maintenance harder and obscures the actual logic\n\nThe entire function could be simplified to a single `git clone` call that handles\nall source types uniformly, removing ~10 lines of duplicated subprocess invocations.\n',
  should_flag: true,
}
