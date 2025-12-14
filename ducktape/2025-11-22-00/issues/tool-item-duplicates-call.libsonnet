{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/state.py',
        ],
        [
          'adgn/src/adgn/agent/types.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/state.py': [
          {
            end_line: 72,
            start_line: 71,
          },
        ],
        'adgn/src/adgn/agent/types.py': [
          {
            end_line: 25,
            start_line: 20,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 71-72 in state.py define `ToolItem` with fields `tool: str` and `call_id: str` that\nduplicate fields from `ToolCall` (types.py:20-25: `name: str`, `call_id: str`, `args_json: str | None`).\n\nThis creates parallel type hierarchies: `ToolItem.tool` duplicates `ToolCall.name`, `ToolItem.call_id`\nduplicates `ToolCall.call_id`. Changes to `ToolCall` require manual updates to `ToolItem`. Lost\ninformation: `ToolCall.args_json` not referenced in `ToolItem`.\n\nEmbed `ToolCall` in `ToolItem` instead of duplicating fields: replace `tool: str` and `call_id: str`\nwith `tool_call: ToolCall`. Keep only UI-specific additions (`decision`, `content`, `ts`). Access\nas `item.tool_call.name` instead of `item.tool`.\n\nThis establishes single source of truth (ToolCall is canonical), composition over duplication (ToolItem\nadds UI concerns), and type safety (ToolCall changes propagate automatically).\n',
  should_flag: true,
}
