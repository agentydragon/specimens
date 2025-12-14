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
  rationale: "The `_create_archive_from_git` function uses subprocess calls to invoke git commands\ndirectly (`subprocess.run([\"git\", \"clone\", ...])`, `subprocess.run([\"git\", \"init\", ...])`,\netc.), while the rest of the codebase consistently uses pygit2 for git operations.\n\nUsing subprocess for git operations has several drawbacks:\n- Inconsistent with codebase conventions (pygit2 is used elsewhere)\n- No type safety or structured error handling (parsing return codes instead of exceptions)\n- Requires spawning external processes (higher overhead)\n- More brittle (depends on git CLI being available and compatible)\n\npygit2 provides a native Python API for git operations including clone, init, remote\nmanagement, fetch, and checkout. The function should be migrated to use pygit2's\n`clone_repository()`, `init_repository()`, `Repository.remotes.create()`,\n`Remote.fetch()`, and `Repository.checkout_tree()` methods.\n\nThis would make the code more maintainable, consistent with project standards, and\nprovide better error handling through structured exceptions rather than subprocess\nreturn codes.\n",
  should_flag: true,
}
