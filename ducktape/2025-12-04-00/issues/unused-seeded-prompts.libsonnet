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
            start_line: 255,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The test_db fixture seeds four Prompt records that are never used by any test.\nLines 257-260 create prompts with sha256 values "test123", "unknown", "test", and\n"train-test", but no test queries or references these values. All tests that use\nthe Prompt table either create their own prompts (e.g., test_agent_queries.py\nline 105 creates "a"*64) or call load_and_upsert_detector_prompt() which creates\nits own entries. These seeded prompts should be deleted.\n',
  should_flag: true,
}
