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
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Calls like `_cap_append(parts, chunk, MAX_PROMPT_CONTEXT_BYTES, "[Context truncated…]")` repeat the same\nconstants at each site. Prefer giving `_cap_append` sensible defaults (or deriving the note from the cap)\nso callers only pass the varying pieces. This reduces duplication and drift risk across call sites.\n',
  should_flag: true,
}
