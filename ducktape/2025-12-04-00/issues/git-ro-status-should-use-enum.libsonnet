{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/git_ro/formatting.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/git_ro/formatting.py': [
          {
            end_line: 69,
            start_line: 68,
          },
        ],
      },
      note: 'StatusEntry uses str for index and worktree instead of GIT_STATUS_* enums',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/git_ro/formatting.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/git_ro/formatting.py': [
          {
            end_line: null,
            start_line: 89,
          },
        ],
      },
      note: 'ChangedFileItem uses str for status instead of GIT_DELTA_* enum',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'The git_ro formatting module uses single-character strings for status fields instead of the appropriate pygit2 enums. Pygit2 provides GIT_DELTA_* constants (e.g., GIT_DELTA_ADDED, GIT_DELTA_MODIFIED, GIT_DELTA_DELETED, GIT_DELTA_RENAMED) for delta status and GIT_STATUS_* constants for working tree and index status.\n\nUsing string literals like "M", "A", "D", "R" loses type safety and requires manual mapping. Pydantic can serialize enums appropriately, so the models should use the native pygit2 enum types instead of str fields.\n\nThis applies to StatusEntry (lines 68-69 for index and worktree fields) and ChangedFileItem (line 89 for status field).\n',
  should_flag: true,
}
