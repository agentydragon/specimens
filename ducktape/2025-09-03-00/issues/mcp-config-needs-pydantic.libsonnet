{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py': [
          {
            end_line: 40,
            start_line: 26,
          },
          {
            end_line: null,
            start_line: 50,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "MCP server configuration is handled using loose types (str | None for paths, Mapping[str, Any] for config objects) instead of proper Pydantic models. This loses the expected structure and forces type errors to be caught at runtime instead of at type-check time.\n\nSpecific problems:\n- _load_mcp_config (lines 26-40) accepts str | None instead of Path | None, and returns untyped dict/list instead of validated Pydantic models\n- _LiveServer.__init__ (line 50) accepts cfg: Mapping[str, Any], but the config has clear expected structure: \"command\" (required string), \"args\" (optional list of strings), \"env\" (optional dict of string pairs)\n\nUsing generic Mapping[str, Any] means:\n- Typos or missing keys are caught at runtime via KeyError\n- Readers must infer the shape from usage\n- No static type checking of config structure\n- Invalid values (wrong types) aren't caught until execution\n\nDefine a Pydantic model that captures the expected shape:\n  class McpServerConfig(BaseModel):\n      command: str\n      args: list[str] = Field(default_factory=list)\n      env: dict[str, str] = Field(default_factory=dict)\n\nThen:\n- _load_mcp_config should accept Path | None, read YAML/JSON, and return validated McpServerConfig instances\n- _LiveServer.__init__ should accept cfg: McpServerConfig directly\n\nThis makes the contract explicit, enables static type checking, and catches configuration errors early.\n",
  should_flag: true,
}
