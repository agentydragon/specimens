{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/minicodex_backend.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/minicodex_backend.py': [
          {
            end_line: 164,
            start_line: 158,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 161-164 discover and create a pygit2 repository inside\n`generate_commit_message_minicodex()`, violating dependency injection.\nThe function creates its own dependencies instead of receiving them.\n\nProblems: harder to test (can't inject test repository), duplicates\ndiscovery logic (caller at cli.py:704 already has repo), tight coupling\nto current working directory.\n\nFix: accept `repo: pygit2.Repository` parameter and pass it through from\nthe caller. The MCP server created internally should also use the injected\nrepository instead of discovering its own.\n",
  should_flag: true,
}
