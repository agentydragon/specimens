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
            end_line: 1191,
            start_line: 1183,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The contract of --output-last-message is that the final output exists only in the designated file.\nFalling back to stdout silently violates that contract and can mask real errors.\nMore importantly, codex is a TUI app: stdout contains box-drawing and UI noise, so substituting it yields random terminal detritus instead of the model’s final message — and it happens silently with a zero exit code.\nPrefer to fail loudly (or request a new run) if the last message file cannot be read.\n',
  should_flag: true,
}
