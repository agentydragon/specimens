{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py': [
          {
            end_line: 58,
            start_line: 53,
          },
          {
            end_line: 71,
            start_line: 60,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Module-level `_DOCKER_CLIENT` and `_CONTAINER_REF` introduce mutable global state that couples requests\nthrough hidden, process-wide singletons. This makes behavior order-dependent, complicates testing,\nand risks leaking configuration across calls.\n\nPrefer explicit dependency injection: pass a Docker client via parameters or a factory, or manage per-request\ncontext that resolves the container ref at call time. Keep state local to the request boundary.\n',
  should_flag: true,
}
