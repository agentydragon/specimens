{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/llm/tools/edit.go',
        ],
        [
          'internal/llm/tools/write.go',
        ],
      ],
      files: {
        'internal/llm/tools/edit.go': [
          {
            end_line: 400,
            start_line: 379,
          },
          {
            end_line: 538,
            start_line: 518,
          },
        ],
        'internal/llm/tools/write.go': [
          {
            end_line: 224,
            start_line: 204,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The same history bookkeeping sequence (ensure file exists, create initial if missing, createVersion when content differs, then always createVersion for new content) is duplicated across edit/delete/replace/write flows. Extract a small helper in the history package (or tools package) to centralize this logic and make intent explicit: EnsureFileVersion(ctx, files, sessionID, filePath, oldContent, newContent).',
  should_flag: true,
}
