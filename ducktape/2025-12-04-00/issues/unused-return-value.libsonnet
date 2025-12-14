{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/git_ro/conftest.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/git_ro/conftest.py': [
          {
            end_line: 28,
            start_line: 18,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Function _commit_all returns str(oid) at line 28, but the return value is unused at all three call sites (lines 47, 50, 54).\nThe function should return None since the value is not needed.\nThe unnecessary str() conversion loses type information (Oid → str) without any benefit when the value is discarded.\nIf future callers need the commit ID, it should return Oid directly (not str).\n',
  should_flag: true,
}
