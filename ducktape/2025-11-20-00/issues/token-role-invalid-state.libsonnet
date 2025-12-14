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
            end_line: 97,
            start_line: 76,
          },
          {
            end_line: null,
            start_line: 86,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'TokenRole + agent_id (mcp_routing.py:76-97) accepts role and agent_id\nseparately, allowing invalid state (AGENT role without agent_id). Should\nuse discriminated union (HumanTokenInfo | AgentTokenInfo) to make invalid\nstate unrepresentable.\n\nCurrent code has runtime check `if not agent_id` at line 86 to handle\nthe invalid state that the type system allows.\n\nUsing discriminated union provides:\n- Type safety: invalid states unrepresentable\n- No runtime validation needed\n- Clear type contracts in signatures\n',
  should_flag: true,
}
