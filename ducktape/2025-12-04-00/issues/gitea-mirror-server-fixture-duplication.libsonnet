{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/test_gitea_mirror_server.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/test_gitea_mirror_server.py': [
          {
            end_line: 70,
            start_line: 70,
          },
          {
            end_line: 97,
            start_line: 97,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The test file has duplicate initialization of `GiteaMirrorServer` with identical arguments at lines 70 and 97:\n\n```python\nmirror_server = server.make_gitea_mirror_server(\n    base_url="https://gitea.local",\n    token="secret-token"\n)\n```\n\nThis pattern appears in multiple test functions with the same test credentials. Should be extracted into a shared pytest fixture (e.g., `gitea_mirror_server`) in conftest.py to:\n- Eliminate duplication\n- Centralize test configuration\n- Make it easier to update test credentials in one place\n- Follow DRY principle for test fixtures\n\nThe fixture should return the initialized server instance, allowing tests to use it directly via dependency injection rather than creating it inline.\n',
  should_flag: true,
}
