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
            end_line: 80,
            start_line: 80,
          },
          {
            end_line: 108,
            start_line: 93,
          },
          {
            end_line: 41,
            start_line: 38,
          },
          {
            end_line: 48,
            start_line: 44,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 80 declares `_backend_apps: dict[str, ASGIApp]` with string keys. Lines 93-108 construct\nstring keys (\"human\" or f\"agent:{agent_id}\") from strongly-typed TokenInfo discriminators, then\nuse these strings for dict lookups.\n\nStringly-typed keys lose type safety (typos in format strings uncaught), fragility (adding new\nTokenInfo types requires remembering string format), and IDE support (no autocomplete/refactoring).\nThe match statement already discriminates on TokenInfo types; converting to strings duplicates\nthis discrimination in a weaker form.\n\nUse TokenInfo directly as dict keys: change to `dict[TokenInfo, ASGIApp]` and replace `backend_key`\nstring construction with `token_info` directly. Requires making HumanTokenInfo and AgentTokenInfo\nfrozen Pydantic models (`model_config = ConfigDict(frozen=True)`) so they're hashable and can serve\nas dict keys. This preserves type information throughout the caching layer.\n",
  should_flag: true,
}
