local I = import 'lib.libsonnet';

I.issue(
  rationale=|||
    Two fixtures `docker_exec_server_alpine` and `docker_inproc_spec_alpine` are functionally identical - both create a container with `alpine:3.19` and return the same `ContainerExecServer` instance.

    Originally these had a minor difference (one passed `tool_exec_name="docker_exec"`), but after refactoring to use `ContainerExecServer` directly, they became completely duplicated:

    ```python
    @pytest.fixture
    async def docker_exec_server_alpine(async_docker_client):
        opts = make_container_opts("alpine:3.19")
        return ContainerExecServer(opts, async_docker_client)

    @pytest.fixture
    async def docker_inproc_spec_alpine(async_docker_client):
        opts = make_container_opts("alpine:3.19")
        return ContainerExecServer(opts, async_docker_client)
    ```

    Should consolidate into a single fixture (keep the more descriptive name `docker_exec_server_alpine`) and update all test references to use it.
  |||,
  filesToRanges={
    'adgn/tests/conftest.py': [[392, 394], [398, 400]],
  }
)
