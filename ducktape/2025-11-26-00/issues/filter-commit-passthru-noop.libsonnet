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
            end_line: 529,
            start_line: 522,
          },
          {
            end_line: null,
            start_line: 578,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 522-529 define `filter_commit_passthru()` which just returns its input\nunchanged. The function's own comment admits it \"may be removed in future.\"\n\nIt's called only at line 578. Delete the function and replace call with just `passthru`.\n\n**Fix:**\n- Delete lines 522-529 (function definition)\n- Line 578: Replace `filter_commit_passthru(passthru)` with `passthru`\n",
  should_flag: true,
}
