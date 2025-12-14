{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/server/test_mcp_routing.py',
        ],
      ],
      files: {
        'adgn/tests/agent/server/test_mcp_routing.py': [
          {
            end_line: 21,
            start_line: 15,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `test_tokens` fixture uses plain dict instead of Pydantic model for type safety.\n\n**Current code (lines 15-21):**\n```python\n@pytest.fixture\ndef test_tokens():\n    \"\"\"Override the global TOKEN_TABLE for testing.\"\"\"\n    return {\n        \"test-human-token\": {\"role\": \"human\"},\n        \"test-agent-token\": {\"role\": \"agent\", \"agent_id\": \"test-agent-1\"},\n        \"test-invalid-role\": {\"role\": \"invalid\"},\n    }\n```\n\n**Why this is problematic:**\n- Test data doesn't match production types (loses type safety)\n- Type errors only caught at runtime, not at test construction\n- Refactoring is unsafe (Pydantic model changes won't break tests immediately)\n- Structure is implicit rather than explicit\n\n**Recommended fix:**\nIf there's a TokenConfig or similar Pydantic model in production code, the fixture\nshould construct instances of that model:\n```python\n@pytest.fixture\ndef test_tokens():\n    return {\n        \"test-human-token\": TokenConfig(role=\"human\"),\n        \"test-agent-token\": TokenConfig(role=\"agent\", agent_id=\"test-agent-1\"),\n        \"test-invalid-role\": TokenConfig(role=\"invalid\"),\n    }\n```\n\nThis ensures test data matches production types, catches errors early, and makes\nrefactoring safer.\n",
  should_flag: true,
}
