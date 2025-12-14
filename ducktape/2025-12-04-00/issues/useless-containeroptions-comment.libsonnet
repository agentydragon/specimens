{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/exec/docker/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/exec/docker/server.py': [
          {
            end_line: 25,
            start_line: 25,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The docstring comment "Callers must pass a fully constructed ContainerOptions (no kwargs)" in `make_container_exec_server` is obvious and useless. The function signature already shows `opts: ContainerOptions` as a required parameter with no kwargs accepted for the opts itself.\n\nThis comment adds no information beyond what the type annotation already communicates. Delete it.\n',
  should_flag: true,
}
