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
            end_line: 60,
            start_line: 60,
          },
          {
            end_line: 137,
            start_line: 135,
          },
          {
            end_line: 156,
            start_line: 155,
          },
          {
            end_line: 176,
            start_line: 175,
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
  rationale: 'The constant name `MAX_PROMPT_CONTEXT_BYTES` uses two near-synonyms in this code path ("prompt" and "context").\nEither pick one term and scope it correctly, or enforce a true global prompt cap:\n\nOptions:\n- Rename to reflect true scope (per-block cap): e.g., `MAX_PROMPT_GIT_OUTPUT_BYTES` (applies to each appended block)\n- Or adopt a global `MAX_PROMPT_BYTES` and enforce an overall cap, leaving block-level caps as internal helpers\n\nThis reduces ambiguity, communicates scope precisely, and prevents misinterpretation.\n',
  should_flag: true,
}
