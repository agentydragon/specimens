{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/core.py',
        ],
        [
          'adgn/src/adgn/mcp/git_ro/formatting.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/core.py': [
          {
            end_line: 54,
            start_line: 36,
          },
          {
            end_line: 186,
            start_line: 169,
          },
        ],
        'adgn/src/adgn/mcp/git_ro/formatting.py': [
          {
            end_line: 108,
            start_line: 99,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The code manually maps pygit2 delta status constants to single-letter codes\n(A/M/D/R/T) in two places, but pygit2 provides a built-in method for this:\n`DiffDelta.status_char()`.\n\n**Current implementation:**\nManual if/elif chains mapping pygit2.GIT_DELTA_* constants to single letters (A/M/D/R/T)\nappear in both `_format_name_status` (lines 36-54) and `diffstat` (lines 169-186).\n\n**Problems:**\n1. **Code duplication**: The same status→letter mapping logic appears twice\n2. **Maintenance burden**: Adding support for new status codes (e.g., COPIED='C')\n   requires updating multiple locations\n3. **Ignores available library utility**: pygit2 provides `DiffDelta.status_char()`\n   which wraps libgit2's `git_diff_status_char()` - the canonical implementation\n\n**Correct approach:**\nUse `delta.status_char()` to get single-character abbreviations directly. Handle\nrenames by checking `d.status == pygit2.GIT_DELTA_RENAMED` for the two-path format.\n\n**Benefits:**\n1. Single source of truth via libgit2's canonical implementation\n2. Future-proof: New status codes work automatically\n3. Less code: No manual if/elif chains needed\n4. Correct edge cases: Handles UNTRACKED→space automatically\n\n**Note:** The `STATUS_LETTER_TO_TEXT` dict (lines 67-73) can remain as-is since\nit maps to display text (\"new file:\", \"modified:\"), which is presentation-specific.\n",
  should_flag: true,
}
