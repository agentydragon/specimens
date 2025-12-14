{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/test_chat_notifications.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/test_chat_notifications.py': [
          {
            end_line: null,
            start_line: 21,
          },
        ],
      },
      note: 'Creates Compositor("compositor") - inconsistent name',
      occurrence_id: 'occ-0',
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
            start_line: 47,
          },
        ],
      },
      note: 'Creates Compositor("comp") directly',
      occurrence_id: 'occ-1',
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
            start_line: 34,
          },
        ],
      },
      note: 'Creates Compositor("comp") directly',
      occurrence_id: 'occ-2',
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
            start_line: 46,
          },
        ],
      },
      note: 'Creates Compositor("comp") directly',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/compositor/test_pinned_unmount.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/compositor/test_pinned_unmount.py': [
          {
            end_line: null,
            start_line: 20,
          },
        ],
      },
      note: 'Creates Compositor("comp") directly',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/test_stdio_notifications_envelope.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/test_stdio_notifications_envelope.py': [
          {
            end_line: null,
            start_line: 43,
          },
        ],
      },
      note: 'Creates Compositor("comp") directly',
      occurrence_id: 'occ-5',
    },
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
            start_line: 26,
          },
          {
            end_line: null,
            start_line: 47,
          },
        ],
      },
      note: 'Creates two Compositor instances ("comp" and "comp2")',
      occurrence_id: 'occ-6',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/resources/test_subscribe.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/resources/test_subscribe.py': [
          {
            end_line: null,
            start_line: 18,
          },
        ],
      },
      note: 'Creates Compositor("comp") directly',
      occurrence_id: 'occ-7',
    },
  ],
  rationale: "Eight test files create Compositor instances directly (e.g., `comp = Compositor(\"comp\")`)\ninstead of using shared pytest fixtures. Occurrences in test_chat_notifications.py,\ntest_resources_subscriptions_index.py, test_notifications.py, test_subscriptions_index.py,\ntest_pinned_unmount.py, test_stdio_notifications_envelope.py,\ntest_list_changes_subscriptions.py (creates two: \"comp\" and \"comp2\"),\ntest_subscribe.py.\n\nProblems: Code duplication across test files, inconsistent naming (most use \"comp\",\none uses \"compositor\", one uses \"comp2\"), hard to mock (can't inject test doubles\nat fixture level), no reuse (every test creates own instance).\n\nUse shared pytest fixtures. Benefits: single source of truth for test compositor\ncreation, easy to mock/configure globally, consistent naming and setup, follows\npytest best practices.\n",
  should_flag: true,
}
