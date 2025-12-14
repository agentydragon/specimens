{
  occurrences: [
    {
      expect_caught_from: [
        [
          'e2e/mock_openai_responses.go',
        ],
      ],
      files: {
        'e2e/mock_openai_responses.go': [
          {
            end_line: 219,
            start_line: 218,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Historical "deadcode pruned" comment appears to document an edit history ("emitStage1 was unused") and is no longer useful to readers; delete the comment to avoid confusion.',
  should_flag: true,
}
