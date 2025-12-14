{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/llm/tools/bash.go',
        ],
      ],
      files: {
        'internal/llm/tools/bash.go': null,
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Bash tool timeout/limits documentation is inconsistent with implementation.\n\n- Prompt/help text claims default timeout is 30 minutes and that maximum is 10 minutes.\n- Actual implementation uses a default of 1 minute and a maximum of 10 minutes.\n\nImpact: Users get misleading guidance about default behavior; automated docs drift from behavior.\n\nRecommendation: Use a single source of truth (constants) and render the prompt/help text from those values at build time,\nso the displayed defaults/max align with the code.\n',
  should_flag: true,
}
