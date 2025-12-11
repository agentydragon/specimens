local I = import 'lib.libsonnet';

I.issue(
  rationale=|||
    Tests in the git_ro test suite repeatedly use `async with typed_git_ro() as client:` (8 occurrences across test_diff.py, test_show.py, test_status_log.py, and conftest.py). This is a violation of the DRY principle - the `typed_git_ro` fixture should be converted to a yield fixture to eliminate this boilerplate.

    Current pattern (repeated in every test):
    ```python
    async def test_something(typed_git_ro):
        async with typed_git_ro() as client:
            result = await client.diff(...)
            assert ...
    ```

    The fixture currently returns a factory function (lines 75-80 in conftest.py):
    ```python
    @pytest.fixture
    def typed_git_ro(repo_git_ro: Path, make_typed_mcp):
        server = GitRoServer(repo_git_ro)

        @asynccontextmanager
        async def _open():
            async with make_typed_mcp(server, GIT_RO_SERVER_NAME) as (client, _session):
                yield client

        return _open
    ```

    Suggested refactoring: Convert to a yield fixture:
    ```python
    @pytest.fixture
    async def typed_git_ro(repo_git_ro: Path, make_typed_mcp):
        server = GitRoServer(repo_git_ro)
        async with make_typed_mcp(server, GIT_RO_SERVER_NAME) as (client, _session):
            yield client
    ```

    Then tests can simply use:
    ```python
    async def test_something(typed_git_ro):
        result = await typed_git_ro.diff(...)
        assert ...
    ```

    This eliminates 8 instances of the `async with` boilerplate and makes tests more concise.
  |||,
  filesToRanges={
    'adgn/tests/mcp/git_ro/conftest.py': [[65, 80]],  // fixture definition
    'adgn/tests/mcp/git_ro/test_diff.py': [[7, 8], [29, 30]],  // two occurrences
    'adgn/tests/mcp/git_ro/test_show.py': [[8, 8], [22, 22]],  // two occurrences
    'adgn/tests/mcp/git_ro/test_status_log.py': [[8, 8], [14, 14]],  // two occurrences
  },
  expect_caught_from=[
    ['adgn/tests/mcp/git_ro/conftest.py'],  // Seeing fixture definition alone is enough
    ['adgn/tests/mcp/git_ro/test_diff.py'],  // Seeing any test file shows the pattern
    ['adgn/tests/mcp/git_ro/test_show.py'],
    ['adgn/tests/mcp/git_ro/test_status_log.py'],
  ],
)
