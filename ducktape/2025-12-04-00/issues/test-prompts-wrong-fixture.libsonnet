{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/props/conftest.py',
        ],
      ],
      files: {
        'adgn/tests/props/conftest.py': [
          {
            end_line: 260,
            start_line: 256,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 256-260 create test prompts inline in the fixture with invalid prompt_sha256 values\n("test123", etc. are not valid SHA256 hashes) and mocked text instead of using the proper\nhash_and_upsert_prompt helper which would compute correct SHA256 hashes.\n\nThese should either be moved to dedicated prompt fixtures with proper SHA256 calculation,\nor deleted if not actually needed by tests.\n',
  should_flag: true,
}
