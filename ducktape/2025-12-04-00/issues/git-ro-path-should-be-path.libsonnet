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
            end_line: null,
            start_line: 66,
          },
        ],
      },
      note: 'StatusEntry.path is str',
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
            start_line: 88,
          },
        ],
      },
      note: 'ChangedFileItem.path is str',
      occurrence_id: 'occ-1',
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
            start_line: 131,
          },
        ],
      },
      note: 'StatItem.path is str',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'The git_ro formatting module uses str for path fields instead of pathlib.Path. Using Path objects provides better type safety and enables path manipulation methods. Per project conventions, paths should be represented as Path objects and only converted to str at I/O boundaries.\n\nThis affects StatusEntry (line 66), ChangedFileItem (line 88), and StatItem (line 131).\n',
  should_flag: true,
}
