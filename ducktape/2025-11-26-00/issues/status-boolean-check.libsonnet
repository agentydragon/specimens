{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
        [
          'adgn/src/adgn/git_commit_ai/core.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: null,
            start_line: 735,
          },
        ],
        'adgn/src/adgn/git_commit_ai/core.py': [
          {
            end_line: 120,
            start_line: 69,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 735 calls `_format_status_porcelain(repo)` just to check if the result is empty.\nThis does unnecessary work: `_format_status_porcelain()` (core.py:69-120) builds a full\nporcelain-format status string, but line 735 only needs a boolean: \"are there changes?\"\n\n**The issue:** We're formatting a detailed string just to check its emptiness. At this\ncall site, we don't care WHAT the changes are, only WHETHER any exist.\n\n**Fix:** Use `bool(repo.status())` or a `has_uncommitted_changes(repo)` helper instead.\n`repo.status()` returns a dict; empty dict means no changes.\n\nOther uses of `_format_status_porcelain()` (core.py:134, editor_template.py:30) are\nlegitimate - they need the formatted string. This boolean check should not trigger\nexpensive formatting.\n",
  should_flag: true,
}
