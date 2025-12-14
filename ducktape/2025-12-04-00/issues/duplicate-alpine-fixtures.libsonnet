{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/conftest.py',
        ],
      ],
      files: {
        'adgn/tests/conftest.py': [
          {
            end_line: 394,
            start_line: 392,
          },
          {
            end_line: 400,
            start_line: 398,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Two fixtures `docker_exec_server_alpine` and `docker_inproc_spec_alpine` are functionally identical - both create a container with `alpine:3.19` and return the same `ContainerExecServer` instance.\n\nOriginally these had a minor difference (one passed `tool_exec_name="docker_exec"`), but after refactoring to use `ContainerExecServer` directly, they became completely duplicated:\n\n```python\n@pytest.fixture\nasync def docker_exec_server_alpine(async_docker_client):\n    opts = make_container_opts("alpine:3.19")\n    return ContainerExecServer(opts, async_docker_client)\n\n@pytest.fixture\nasync def docker_inproc_spec_alpine(async_docker_client):\n    opts = make_container_opts("alpine:3.19")\n    return ContainerExecServer(opts, async_docker_client)\n```\n\nShould consolidate into a single fixture (keep the more descriptive name `docker_exec_server_alpine`) and update all test references to use it.\n',
  should_flag: true,
}
