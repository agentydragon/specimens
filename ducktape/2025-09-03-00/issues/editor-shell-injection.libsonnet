{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: 934,
            start_line: 920,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "In llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py the editor is invoked via:\n`asyncio.create_subprocess_shell(f\"{editor} {commit_msg_path}\")`.\n\nThis concatenates the filename into the shell command string. That is not Git-compatible and\nbreaks with spaces/quotes in either the editor value or the path; it also changes parsing semantics.\n\nCorrect Git-compatible invocation keeps shell semantics but appends the filename as a separate\nargument through the shell wrapper (like Git's run-command):\n\n  /bin/sh -c '<editor> \"$@\"' <editor> <realpath-to-COMMIT_EDITMSG>\n  # On Git for Windows, use `sh -c` rather than `/bin/sh -c`.\n\nAcceptance criteria:\n- Replace the f-string shell command with the shell-wrapper form above (or an equivalent that\n  passes the path as a separate arg rather than interpolating it into the command string).\n- Resolve the editor via `git var GIT_EDITOR` (respects precedence and \":\" no-op).\n- Keep shell usage for full Git compatibility; do not flag shell usage itself.\n- (Optional) Validate COMMIT_EDITMSG path (e.g., symlink/permissions) before launch.\n",
  should_flag: true,
}
