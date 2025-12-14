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
            end_line: 161,
            start_line: 159,
          },
          {
            end_line: null,
            start_line: 751,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 751 calls `get_short_commitish(repo)` to obtain a 7-character commit hash prefix\nfor the cache key. Using a shortened hash is unnecessary here.\n\n**Why full hash is better:**\nCache keys are SHA256-hashed anyway (line 207), so input length doesn't matter for\nreadability or performance. Full hash is more precise (eliminates collision risk) and\nremoves the need for a dedicated `get_short_commitish()` function (lines 159-161).\n\n**Fix:** Use `str(repo.head.peel(pygit2.Commit).id)` directly or inline it into the\n`build_cache_key()` call. Delete `get_short_commitish()` if unused elsewhere.\n",
  should_flag: true,
}
