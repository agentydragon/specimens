{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/test_resources_subscriptions_index.py',
        ],
        [
          'adgn/tests/mcp/resources/test_subscriptions_index.py',
        ],
        [
          'adgn/tests/mcp/compositor/test_pinned_unmount.py',
        ],
        [
          'adgn/tests/mcp/test_notifications_envelope.py',
        ],
        [
          'adgn/tests/mcp/compositor/test_meta_inproc_proxies.py',
        ],
        [
          'adgn/tests/mcp/compositor/test_admin_client.py',
        ],
        [
          'adgn/tests/mcp/exec/test_docker_unit.py',
        ],
        [
          'adgn/tests/mcp/test_chat_server.py',
        ],
        [
          'adgn/tests/mcp/test_mcp_flat_model_helper.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/compositor/test_admin_client.py': [
          {
            end_line: 15,
            start_line: 8,
          },
        ],
        'adgn/tests/mcp/compositor/test_meta_inproc_proxies.py': [
          {
            end_line: 18,
            start_line: 11,
          },
        ],
        'adgn/tests/mcp/compositor/test_pinned_unmount.py': [
          {
            end_line: 16,
            start_line: 9,
          },
        ],
        'adgn/tests/mcp/exec/test_docker_unit.py': [
          {
            end_line: 12,
            start_line: 10,
          },
        ],
        'adgn/tests/mcp/resources/test_subscriptions_index.py': [
          {
            end_line: 43,
            start_line: 31,
          },
        ],
        'adgn/tests/mcp/test_chat_server.py': [
          {
            end_line: 29,
            start_line: 23,
          },
        ],
        'adgn/tests/mcp/test_mcp_flat_model_helper.py': [
          {
            end_line: 31,
            start_line: 23,
          },
        ],
        'adgn/tests/mcp/test_notifications_envelope.py': [
          {
            end_line: 26,
            start_line: 9,
          },
        ],
        'adgn/tests/mcp/test_resources_subscriptions_index.py': [
          {
            end_line: 42,
            start_line: 31,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Multiple test files define helper functions (`def _...`) that create test servers or\nresources. These basic factories should be pytest fixtures instead of directly-called\nfunctions.\n\n**Pattern:** Functions like `_make_origin()`, `_backend()`, `_make_server()` are called\ndirectly in tests instead of using pytest's dependency injection.\n\n**Problems:**\n1. Called directly instead of using pytest's dependency injection\n2. Not reusable across test files without duplication\n3. Can't easily override or mock for specific test scenarios\n4. Doesn't follow pytest best practices\n\n**Fix:** Convert to `@pytest.fixture` decorated functions. Tests receive them as\nparameters instead of calling directly. Benefits: follows pytest conventions, reusable\nvia conftest.py, easy to override with fixture scope, can be parameterized, better\ntest isolation.\n\n**Affected functions across 9 files:** `_make_origin()` (2x), `_backend()`, `_make_notifier()`,\n`_make_backend()` (2x), `_make_server()`, `create_chat_servers()`, `make_echo_server()`.\nNote: some similar functions are already fixtures (e.g., `bus()` in test_ui_server.py)\nor take fixture parameters and are correctly implemented.\n",
  should_flag: true,
}
