{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/git_ro/conftest.py',
        ],
        [
          'adgn/tests/mcp/git_ro/test_diff.py',
        ],
        [
          'adgn/tests/mcp/git_ro/test_show.py',
        ],
        [
          'adgn/tests/mcp/git_ro/test_status_log.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/git_ro/conftest.py': [
          {
            end_line: 80,
            start_line: 65,
          },
        ],
        'adgn/tests/mcp/git_ro/test_diff.py': [
          {
            end_line: 8,
            start_line: 7,
          },
          {
            end_line: 30,
            start_line: 29,
          },
        ],
        'adgn/tests/mcp/git_ro/test_show.py': [
          {
            end_line: 8,
            start_line: 8,
          },
          {
            end_line: 22,
            start_line: 22,
          },
        ],
        'adgn/tests/mcp/git_ro/test_status_log.py': [
          {
            end_line: 8,
            start_line: 8,
          },
          {
            end_line: 14,
            start_line: 14,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Tests in the git_ro test suite repeatedly use `async with typed_git_ro() as client:` (8 occurrences across test_diff.py, test_show.py, test_status_log.py, and conftest.py). This is a violation of the DRY principle - the `typed_git_ro` fixture should be converted to a yield fixture to eliminate this boilerplate.\n\nCurrent pattern (repeated in every test):\n```python\nasync def test_something(typed_git_ro):\n    async with typed_git_ro() as client:\n        result = await client.diff(...)\n        assert ...\n```\n\nThe fixture currently returns a factory function (lines 75-80 in conftest.py):\n```python\n@pytest.fixture\ndef typed_git_ro(repo_git_ro: Path, make_typed_mcp):\n    server = GitRoServer(repo_git_ro)\n\n    @asynccontextmanager\n    async def _open():\n        async with make_typed_mcp(server, GIT_RO_SERVER_NAME) as (client, _session):\n            yield client\n\n    return _open\n```\n\nSuggested refactoring: Convert to a yield fixture:\n```python\n@pytest.fixture\nasync def typed_git_ro(repo_git_ro: Path, make_typed_mcp):\n    server = GitRoServer(repo_git_ro)\n    async with make_typed_mcp(server, GIT_RO_SERVER_NAME) as (client, _session):\n        yield client\n```\n\nThen tests can simply use:\n```python\nasync def test_something(typed_git_ro):\n    result = await typed_git_ro.diff(...)\n    assert ...\n```\n\nThis eliminates 8 instances of the `async with` boilerplate and makes tests more concise.\n',
  should_flag: true,
}
