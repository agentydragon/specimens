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
            end_line: 647,
            start_line: 641,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 641-647 extract the commit message from the editor file (removing scissors\nand comments), then pass the file path to `git commit -F ... --cleanup=strip`.\n\n**Problem:** We already did the cleanup ourselves in `_extract_commit_content()`.\nThere's no need to use `-F` (read from file) when we have the clean message in\n`commit_message` variable.\n\n**Current:**\n```python\ncommit_message = _extract_commit_content(final_content)\nif not commit_message:\n    print(\"Aborting commit due to empty commit message.\", file=sys.stderr)\n    raise ExitWithCode(1)\nawait _execute_git_commit([\"-F\", str(commit_msg_path), \"--cleanup=strip\"], passthru)\n```\n\n**Simplified:**\n```python\ncommit_message = _extract_commit_content(final_content)\n# Empty check removed - see issue 035 (let Git handle it)\nawait _execute_git_commit(message=commit_message, passthru=passthru)\n```\n\n**Benefits:**\n1. No need to pass file path and `--cleanup=strip` flag\n2. Enables making `message` an explicit parameter (issue 034)\n3. Clearer: we have the message, just use it directly\n4. Don't need to rely on COMMIT_EDITMSG file still existing\n\n**Note:** This change pairs well with issue 034 (making message an explicit\nrequired string parameter in `_execute_git_commit`).\n",
  should_flag: true,
}
