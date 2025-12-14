{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp_bridge/test_integration.py',
        ],
        [
          'adgn/tests/mcp/agents/test_agents_server.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/agents/test_agents_server.py': [
          {
            end_line: 30,
            start_line: 21,
          },
        ],
        'adgn/tests/mcp_bridge/test_integration.py': [
          {
            end_line: 79,
            start_line: 74,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `mock_registry` pytest fixture is duplicated in two test files with nearly\nidentical implementations:\n\n1. tests/mcp_bridge/test_integration.py (lines 74-79):\n   def mock_registry(sqlite_persistence):\n       """Create mock infrastructure registry using real persistence."""\n       registry = MagicMock()\n       registry.list_agents.return_value = []\n       registry.persistence = sqlite_persistence\n       return registry\n\n2. tests/mcp/agents/test_agents_server.py (lines 21-30):\n   def mock_registry(sqlite_persistence):\n       """Create a mock registry for testing agents server.\n\n       Uses real persistence for data storage, but mocks the agent container tracking.\n       """\n       registry = MagicMock()\n       registry.persistence = sqlite_persistence\n       registry.list_agents.return_value = []\n       registry.is_external.return_value = False\n       return registry\n\nBoth fixtures:\n- Have the same name and signature\n- Accept sqlite_persistence parameter\n- Create a MagicMock for the registry\n- Set persistence attribute\n- Mock list_agents to return empty list\n\nThe second fixture adds one additional mock (is_external), but this is a minor\ndifference that could be handled by having the shared fixture mock it by default\n(or by parameterizing the fixture).\n\nThis duplication should be eliminated by consolidating the fixture into a\nshared conftest.py file (e.g., tests/conftest.py or tests/mcp/conftest.py).\n\nThe consolidated fixture should include all mocked methods needed across both\ntest files, or use a factory pattern if different tests need different mock\nconfigurations.\n',
  should_flag: true,
}
