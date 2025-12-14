{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/llm/tools/edit.go',
        ],
      ],
      files: {
        'internal/llm/tools/edit.go': [
          {
            end_line: 183,
            start_line: 145,
          },
          {
            end_line: 275,
            start_line: 200,
          },
          {
            end_line: 470,
            start_line: 456,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'When OldString is empty Run() creates the file (createNewFile) but then still falls through and calls replaceContent which treats empty old_string as a literal match, causing "appears multiple times" errors and masking the successful create. Make the branches mutually exclusive (else-if / early return) or otherwise ensure replaceContent is not invoked after a create.',
  should_flag: true,
}
