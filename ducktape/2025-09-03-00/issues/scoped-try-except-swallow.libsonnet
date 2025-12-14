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
            end_line: null,
            start_line: 138,
          },
        ],
      },
      note: 'scoped try/except swallows errors',
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
            end_line: null,
            start_line: 157,
          },
        ],
      },
      note: 'scoped try/except swallows errors',
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
            end_line: null,
            start_line: 177,
          },
        ],
      },
      note: 'scoped try/except swallows errors',
      occurrence_id: 'occ-2',
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
            end_line: null,
            start_line: 196,
          },
        ],
      },
      note: 'scoped try/except swallows errors',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py': [
          {
            end_line: 59,
            start_line: 55,
          },
        ],
      },
      note: 'mkdir failure silently falls back to cwd, hiding operational problems',
      occurrence_id: 'occ-4',
    },
  ],
  rationale: 'Scoped try/except blocks swallow errors instead of failing loudly.\nWhere there is no specific recovery/handling need, do not catch at all — let exceptions bubble normally.\nWhere there is a specific reason to handle, catch only the narrow exception and do not swallow silently (log and/or re-raise as appropriate).\n',
  should_flag: true,
}
