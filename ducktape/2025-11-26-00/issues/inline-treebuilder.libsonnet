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
            end_line: 137,
            start_line: 136,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 136-137 create TreeBuilder, write it, and never use `tb` again. Inline:\n\n**Current:** `tb = repo.TreeBuilder() ; empty_tree_oid = tb.write()`\n**Fix:** `empty_tree_oid = repo.TreeBuilder().write()`\n',
  should_flag: true,
}
