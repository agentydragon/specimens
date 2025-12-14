{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/resources/test_list_changes_subscriptions.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/resources/test_list_changes_subscriptions.py': [
          {
            end_line: null,
            start_line: 31,
          },
          {
            end_line: null,
            start_line: 54,
          },
        ],
      },
      note: 'Two tests manually create resources server with make_resources_server',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/resources/test_subscriptions_index.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/resources/test_subscriptions_index.py': [
          {
            end_line: null,
            start_line: 52,
          },
        ],
      },
      note: 'Test manually creates resources server with make_resources_server',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/test_resources_subscriptions_index.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/test_resources_subscriptions_index.py': [
          {
            end_line: null,
            start_line: 53,
          },
        ],
      },
      note: 'Test manually creates resources server with make_resources_server',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/resources/test_notifications.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/resources/test_notifications.py': [
          {
            end_line: null,
            start_line: 35,
          },
        ],
      },
      note: 'Test manually creates resources server with make_resources_server',
      occurrence_id: 'occ-3',
    },
  ],
  rationale: "Tests manually create resources servers with `make_resources_server(name=\"resources\", compositor=comp)`\ninstead of using shared pytest fixtures (`resources_server`, `resources_client`, `typed_resources_client`).\n\n**Problems:**\n1. Duplicates resources server creation logic across tests\n2. `name=\"resources\"` is redundant - that's the default name\n3. Doesn't use shared pytest fixtures\n4. Manually creates ResourcesClient instead of using typed fixture\n5. More boilerplate than necessary\n\n**Benefits of using fixtures:**\n1. Follows pytest conventions\n2. Less boilerplate - no manual server/client creation\n3. Easier to test - can mock fixtures\n4. Consistent with other tests using fixtures\n5. No redundant name parameter\n",
  should_flag: true,
}
