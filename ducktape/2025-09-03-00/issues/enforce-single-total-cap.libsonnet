{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: 137,
            start_line: 133,
          },
          {
            end_line: 156,
            start_line: 154,
          },
          {
            end_line: 176,
            start_line: 174,
          },
          {
            end_line: 195,
            start_line: 194,
          },
          {
            end_line: 205,
            start_line: 201,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Current caps are applied per git output block (status / name-status / log / diff), so the assembled\nprompt can reach many× the nominal cap. Prefer a single accumulator-based total cap enforced over the\nfully assembled prompt, or track remaining bytes across calls to `_cap_append` to share the budget.\n\nThis yields predictable size, avoids double work, and makes tradeoffs explicit between sections.\n',
  should_flag: true,
}
