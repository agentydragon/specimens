{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/mcp_routing.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/mcp_routing.py': [
          {
            end_line: 40,
            start_line: 37,
          },
          {
            end_line: null,
            start_line: 115,
          },
          {
            end_line: null,
            start_line: 116,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "TOKEN_TABLE uses nested untyped dicts (mcp_routing.py:37-40):\n\nTOKEN_TABLE: dict[str, dict[str, str]] = {\n    \"human-token-123\": {\"role\": \"human\"},\n    \"agent-token-abc\": {\"role\": \"agent\", \"agent_id\": \"agent-1\"},\n}\n\nProblems:\n- No type safety: can't validate field presence\n- No autocomplete for fields (role, agent_id)\n- Field names are magic strings\n- Can't distinguish required vs optional fields\n- Code accesses with dict[\"role\"], dict.get(\"agent_id\")\n\nShould define Pydantic model:\nclass TokenInfo(BaseModel):\n    role: TokenRole  # Already a StrEnum\n    agent_id: AgentID | None = None\n\nTOKEN_TABLE: dict[str, TokenInfo] = {\n    \"human-token-123\": TokenInfo(role=TokenRole.HUMAN),\n    \"agent-token-abc\": TokenInfo(role=TokenRole.AGENT, agent_id=\"agent-1\"),\n}\n\nBenefits:\n- Type safety: token_info.role, token_info.agent_id\n- Validation: can't create invalid TokenInfo\n- Clear schema: required role, optional agent_id\n- IDE support: autocomplete and type checking\n\nCode already uses TokenRole enum, should extend to full typed model.\n",
  should_flag: true,
}
