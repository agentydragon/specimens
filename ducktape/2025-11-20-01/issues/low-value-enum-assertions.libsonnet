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
            end_line: 150,
            start_line: 149,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The test contains low-value enum assertions that just duplicate production code definitions.\n\n**Current code (lines 149-150):**\n```python\n@pytest.mark.asyncio\nasync def test_token_role_enum(self):\n    \"\"\"Test TokenRole enum values.\"\"\"\n    assert TokenRole.HUMAN == \"human\"\n    assert TokenRole.AGENT == \"agent\"\n\n    # Test that enum can be created from string\n    role = TokenRole(\"human\")\n    assert role == TokenRole.HUMAN\n```\n\n**Why these assertions are low-value:**\n- Lines 149-150 just assert the enum values equal their string representations\n- This duplicates what's already in the production code definition\n- If someone changes the enum value, they'll see it immediately without needing a test\n- The assertions don't test any meaningful behavior\n\n**What should stay:**\nLines 152-154 (testing enum construction from string) have value because they test\nactual behavior rather than just duplicating definitions. Keep these.\n\n**Recommended fix:**\nDelete assertions at lines 149-150. Keep the string-to-enum construction test (lines 152-154)\nas it verifies actual parsing behavior.\n",
  should_flag: true,
}
