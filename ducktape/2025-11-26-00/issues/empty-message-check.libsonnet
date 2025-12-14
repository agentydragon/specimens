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
            end_line: 590,
            start_line: 588,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 588-590 check if the AI message is empty and abort with a custom error.\nThis duplicates Git's built-in behavior - Git already rejects empty commit messages.\n\n**Current:**\n```python\nif not msg.strip():\n    print(\"Aborting commit due to empty AI commit message.\", file=sys.stderr)\n    raise ExitWithCode(1)\n```\n\n**Problems:**\n1. \"empty AI commit message\" is misleading - implies AI-specific issue\n2. Duplicates Git's validation\n3. Prevents Git flags like `--allow-empty-message` from working\n4. We don't check for editor-flow messages (line 643-645) being empty - inconsistent\n\n**Fix:**\nDelete lines 588-590. Pass the message to Git as-is and let Git validate it.\nGit will print \"Aborting commit due to empty commit message.\" if needed.\n\n**Optional:** Add one-line comment: `# Git will validate message is non-empty`\n\n**Consider:** Write integration test that verifies empty message is rejected\n(but by Git, not by our code).\n",
  should_flag: true,
}
