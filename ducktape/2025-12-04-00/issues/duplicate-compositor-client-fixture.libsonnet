{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/conftest.py',
          'adgn/tests/agent/conftest.py',
        ],
      ],
      files: {
        'adgn/tests/agent/conftest.py': [
          {
            end_line: 52,
            start_line: 49,
          },
        ],
        'adgn/tests/mcp/conftest.py': [
          {
            end_line: 50,
            start_line: 47,
          },
        ],
      },
      note: 'Duplicate fixture definition across MCP and agent test suites',
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `compositor_client` fixture is defined identically in two separate conftest.py\nfiles, violating DRY principle:\n\n1. tests/mcp/conftest.py:47-50\n2. tests/agent/conftest.py:49-52\n\nBoth have identical implementation (only docstring differs slightly):\n\n```python\n@pytest.fixture\nasync def compositor_client(compositor):\n    """Client connected to the compositor."""\n    async with Client(compositor) as client:\n        yield client\n```\n\nThis creates potential issues:\n- Fixture shadowing/conflicts when tests import from both scopes\n- Maintenance burden: changes must be duplicated in both places\n- Inconsistent docstrings ("compositor" vs "compositor fixture")\n\nResolution: Consolidate into a single shared fixture in the common conftest.py\n(likely tests/conftest.py at the root level, or keep in tests/mcp/conftest.py\nsince MCP tests are the primary consumer and agent tests can import from there).\n',
  should_flag: true,
}
