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
            end_line: 275,
            start_line: 226,
          },
        ],
      },
      note: 'createNewFile branch: diff+permission+write+history+record bookkeeping.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/edit.go',
        ],
      ],
      files: {
        'internal/llm/tools/edit.go': [
          {
            end_line: 406,
            start_line: 349,
          },
        ],
      },
      note: 'deleteContent branch: diff+permission+write+history+record bookkeeping (similar pattern).',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/llm/tools/edit.go',
        ],
      ],
      files: {
        'internal/llm/tools/edit.go': [
          {
            end_line: 550,
            start_line: 488,
          },
        ],
      },
      note: 'replaceContent branch: same sequence; extract helper EnsureWriteWithHistory(ctx, files, sessionID, filePath, oldContent, newContent, action, desc, params...).',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'A ~30-line sequence (generate diff, build permission.CreatePermissionRequest, write file, history bookkeeping, recordFileWrite/read) is duplicated across multiple branches in internal/llm/tools/edit.go. Extract a single helper parameterized by action, description, and params to centralize permission, diff, write, history bookkeeping and avoid drift.\n',
  should_flag: true,
}
