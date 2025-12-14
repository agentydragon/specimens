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
            end_line: 584,
            start_line: 571,
          },
          {
            end_line: null,
            start_line: 591,
          },
          {
            end_line: null,
            start_line: 647,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The function `_execute_git_commit()` (lines 571-584) takes `message_args: list[str]`\nwhich is always `["-m", msg]` or `["-F", path, "--cleanup=strip"]`.\n\n**Current callers:**\n- Line 591: `_execute_git_commit(["-m", msg], passthru)`\n- Line 647: `_execute_git_commit(["-F", str(commit_msg_path), "--cleanup=strip"], passthru)`\n\n**Problem:** If all callers pass `-m msg`, the message should be an explicit\nparameter. Splitting into separate list arguments obscures the API.\n\n**Verified:** Line 647 is the ONLY caller that uses `-F` flag. Line 591 uses `-m` flag.\nThe function accepts `message_args` but only two callers exist, each using different format.\nIf yes, consider making `message: str` a required parameter and handling `-F`\nvs `-m` internally, or making two separate functions.\n\n**Proposed signature:**\n```python\nasync def _execute_git_commit(message: str, passthru: list[str]) -> None:\n    """Execute git commit with message."""\n    # Validate message is non-empty (see issue 035)\n    commit_proc = await asyncio.create_subprocess_exec(\n        "git", "commit", "-m", message, "--no-verify", *passthru\n    )\n    ...\n```\n\nOr keep `-F` path separate if needed for editor flow.\n',
  should_flag: true,
}
