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
            end_line: 583,
            start_line: 568,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The PTY reader uses two loops (a poll loop until task.done() and a final drain loop). Since the\ndrain loop already consumes remaining data until EOF/error, a single `while True` drain with\nclear exit conditions suffices and simplifies control flow.\n\nSuggestion: replace the poll+drain pair with one loop that reads, writes to the aggregator, and breaks\non EOF/exception. Add a brief comment documenting the exit conditions.\n',
  should_flag: true,
}
