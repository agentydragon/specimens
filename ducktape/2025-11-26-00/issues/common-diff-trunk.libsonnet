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
            end_line: 139,
            start_line: 130,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 130-139 have `repo.diff(...).patch or ""` duplicated in both branches.\nOnly the base commit differs. Factor out the common diff call.\n\n**Current structure:**\n```\nif head.parents:\n    parent = head.parents[0]\n    parts.append("=== Original commit diff (HEAD^ to HEAD) ===")\n    parts.append(repo.diff(parent.id, head.id).patch or "")\nelse:\n    empty_tree_oid = repo.TreeBuilder().write()\n    parts.append("=== Original commit content ===")\n    parts.append(repo.diff(empty_tree_oid, head.id).patch or "")\n```\n\n**Better structure:**\n```\nif head.parents:\n    parent = head.parents[0]\n    base = parent.id\n    parts.append("=== Original commit diff (HEAD^ to HEAD) ===")\nelse:\n    base = repo.TreeBuilder().write()\n    parts.append("=== Original commit content ===")\nparts.append(repo.diff(base, head.id).patch or "")\n```\n\nBranches only determine the base commit and header; diff call is common trunk.\n',
  should_flag: true,
}
