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
            end_line: 281,
            start_line: 280,
          },
        ],
      },
      note: '`previous_message` default — confirm if None is truly exercised; otherwise make it required or resolve before call',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: 1013,
            start_line: 1013,
          },
        ],
      },
      note: 'generate(..., model: str | None = None) — prefer required or resolve default at call site',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: 1103,
            start_line: 1103,
          },
        ],
      },
      note: 'generate(..., model: str | None = None) — prefer required or resolve default at call site',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Optional parameters should only be typed optional when None is a real, exercised state.\nWhen callers always pass a value (or a default is always resolved), drop `| None = None` to tighten contracts and avoid ambiguous call sites.\n',
  should_flag: true,
}
