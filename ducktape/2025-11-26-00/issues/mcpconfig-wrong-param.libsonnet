{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 189,
            start_line: 189,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 189 uses `MCPConfig(servers={})` but the correct parameter name is `mcpServers`,\nnot `servers`. This creates an extra unwanted field in the config object.\n\n**The problem:** Pydantic accepts `servers` due to field aliasing or extra fields config,\nbut it's not canonical. Result: `{'mcpServers': {}, 'servers': {}}` (two fields instead\nof one).\n\nVerified: `MCPConfig().model_dump()` produces `{'mcpServers': {}}`, but\n`MCPConfig(servers={}).model_dump()` produces `{'mcpServers': {}, 'servers': {}}`.\n\n**Fix:** Use `MCPConfig()` (since default is empty dict) or `MCPConfig(mcpServers={})`\nfor explicitness. Removes extra field and matches the actual schema.\n",
  should_flag: true,
}
