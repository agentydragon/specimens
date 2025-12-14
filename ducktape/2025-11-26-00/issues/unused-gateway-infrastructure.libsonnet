{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/resources/test_list_changes_subscriptions.py',
        ],
        [
          'adgn/tests/mcp/resources/test_subscriptions_index.py',
        ],
        [
          'adgn/tests/mcp/test_resources_subscriptions_index.py',
        ],
        [
          'adgn/tests/mcp/resources/test_notifications.py',
        ],
        [
          'adgn/src/adgn/mcp/compositor/setup.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/compositor/setup.py': [
          {
            end_line: 21,
            start_line: 21,
          },
        ],
        'adgn/tests/mcp/resources/test_list_changes_subscriptions.py': [
          {
            end_line: 22,
            start_line: 12,
          },
          {
            end_line: 30,
            start_line: 30,
          },
          {
            end_line: 53,
            start_line: 53,
          },
        ],
        'adgn/tests/mcp/resources/test_notifications.py': [
          {
            end_line: 31,
            start_line: 29,
          },
        ],
        'adgn/tests/mcp/resources/test_subscriptions_index.py': [
          {
            end_line: 24,
            start_line: 14,
          },
          {
            end_line: 51,
            start_line: 51,
          },
        ],
        'adgn/tests/mcp/test_resources_subscriptions_index.py': [
          {
            end_line: 24,
            start_line: 14,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Unused gateway-related infrastructure (stub classes, variables, parameters) that\nshould be deleted. Dead code adds maintenance burden without providing value.\n\n**Three categories of unused gateway infrastructure:**\n\n**1. Test stub classes and variables (never used after definition)**\n\nMultiple test files define `_StubGatewaySession` and `_StubGatewayClient` stub classes\nwith subscribe/unsubscribe methods, then instantiate as `gw = _StubGatewayClient()`,\nbut the gw variable is never used afterward. Not passed to make_resources_server() or\nreferenced in test logic.\n\nLocations:\n- test_list_changes_subscriptions.py: stub classes (lines 12-22), unused gw (lines 30, 53)\n- test_subscriptions_index.py: stub classes (lines 14-24), unused gw (line 51)\n- test_resources_subscriptions_index.py: stub classes (lines 14-24)\n\n**2. Unused async context manager and server variable (test_notifications.py)**\n\nLines 29-31 create `gw_server = FastMCP(\"gw\")` and `async with Client(gw_server) as gw:`\ncontext manager, but the gw variable is never used. Comment says \"placeholder gateway\nclient\" but it's creating a compositor client that isn't needed.\n\n**3. Unused function parameter (setup.py:21)**\n\nThe `gateway_client` parameter is checked with `if gateway_client is not None` but its\nvalue is never referenced in the function body. This is dead conditional logic.\n\n**Problems with unused infrastructure:**\n- Maintenance burden (must update when interfaces change)\n- Confuses readers (looks important but serves no purpose)\n- Suggests missing functionality (why define if not used?)\n- Makes tests harder to understand (extra noise)\n\n**Correct approach: Delete unused code**\n\n- Delete stub class definitions and unused variable instantiations from tests\n- Delete the unused context manager block and gw_server variable\n- Replace unused gateway_client parameter with explicit mount_resources: bool = True\n  parameter to control whether resources server is mounted (update docstring)\n\nTests should only create infrastructure they actually use. Parameters should only\nexist if their values are referenced.\n",
  should_flag: true,
}
