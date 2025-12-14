{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 124,
            start_line: 120,
          },
          {
            end_line: 59,
            start_line: 50,
          },
          {
            end_line: 56,
            start_line: 56,
          },
          {
            end_line: 386,
            start_line: 386,
          },
          {
            end_line: 404,
            start_line: 404,
          },
          {
            end_line: 444,
            start_line: 444,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 120-124 define `PendingApproval` wrapper with fields `tool_call: ToolCall` and `timestamp: datetime`.\nLines 50-59 define `_convert_pending_approvals()` that loops over `pending_map.items()`, wraps each\n`ToolCall` in `PendingApproval` with `timestamp=datetime.now()`. Used at 3 call sites (lines 386, 404, 444).\n\nThis is unnecessary indirection with misleading timestamp: line 56 sets `datetime.now()` at query time,\nnot creation time (TODO comment acknowledges this is wrong). After removing timestamp, wrapper and\nconversion become trivial. Creates intermediate objects when callers could use dict values directly.\n\nDelete `PendingApproval` class (lines 120-124) and `_convert_pending_approvals()` function (lines 50-59).\nReplace call sites with `list(pending_map.values())`. Update return types from `list[PendingApproval]`\nto `list[ToolCall]`. Eliminates misleading timestamp, unnecessary wrapper, and conversion overhead.\n',
  should_flag: true,
}
