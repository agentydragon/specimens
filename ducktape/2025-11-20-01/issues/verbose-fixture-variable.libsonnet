{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/approval_policy/test_policy_resources.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/approval_policy/test_policy_resources.py': [
          {
            end_line: 25,
            start_line: 19,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Fixture contains unnecessary variable and docstring.\n\nThe `persistence` fixture in test_policy_resources.py lines 19-25 has:\n- Single-use variable `db_path` that should be inlined\n- Docstring that adds no value (function name and code are self-documenting)\n\nShould be simplified to:\n```python\n@pytest.fixture\nasync def persistence(tmp_path):\n    persist = SQLitePersistence(tmp_path / "test.db")\n    await persist.ensure_schema()\n    return persist\n```\n',
  should_flag: true,
}
