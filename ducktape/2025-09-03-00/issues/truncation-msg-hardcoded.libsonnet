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
            end_line: 136,
            start_line: 135,
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
            start_line: 193,
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
  rationale: 'The truncation note is hardcoded as "[Context truncated to 100 KiB]" in multiple places, while the cap\nis driven by MAX_PROMPT_CONTEXT_BYTES. This duplicates the limit in string form and risks drift.\n\nPrefer a single source of truth: derive the human text from the cap (e.g., f"[Context truncated to {MAX_PROMPT_CONTEXT_BYTES // 1024} KiB]")\nor use a generic stable marker like "[Context truncated]". Keep the message in one place and reuse it.\n',
  should_flag: true,
}
