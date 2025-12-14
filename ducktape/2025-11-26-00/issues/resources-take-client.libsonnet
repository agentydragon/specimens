{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/resources/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/resources/server.py': [
          {
            end_line: 241,
            start_line: 238,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 238-241 create `Client(compositor)` internally, but resources server should receive Client as parameter instead of Compositor.\n\nViolates \"take what you need\" principle (Dependency Injection): (1) server receives Compositor but only uses it to create Client, (2) creates client internally instead of receiving it, (3) harder to test (can't inject mock/test client).\n\nChange signature to `make_resources_server(name: str, client: Client)` and use client directly. Caller creates Client and passes it. Delete useless comments about \"bypassing policy gateway\" (lines 238-240); parameter docstring should explain this instead. Benefits: takes what it needs, easier to test, clearer dependencies, follows standard DI.\n",
  should_flag: true,
}
