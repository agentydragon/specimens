{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/approvals_bridge.py',
        ],
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 59,
            start_line: 50,
          },
          {
            end_line: 52,
            start_line: 52,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/servers/approvals_bridge.py': [
          {
            end_line: 65,
            start_line: 64,
          },
          {
            end_line: 80,
            start_line: 71,
          },
          {
            end_line: 108,
            start_line: 99,
          },
        ],
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 274,
            start_line: 267,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Three functions build lists imperatively using `append()` in loops instead of list comprehensions.\n\nLines 50-59 in agents.py define `_convert_pending_approvals()` that initializes empty list,\nloops over `pending_map.items()`, and appends `PendingApproval` objects. The function doesn't\nuse `call_id`, so should iterate `.values()` directly.\n\nLines 64-108 in approvals_bridge.py build `approvals_list` with two separate loops: lines 71-80\nappend pending approvals, lines 99-108 append decided approvals (with conditional). Both should\nuse comprehensions and combine via `pending_approvals + decided_approvals`.\n\nLines 267-274 in runtime.py build `proposals` list with nested conditional and loop: checks\npersistence/agent_id, iterates rows, creates intermediate `pid`/`raw` vars, appends. Should use\nconditional expression with comprehension.\n\nReplace imperative `result = []; for x in items: result.append(transform(x))` pattern with\ncomprehensions: `[transform(x) for x in items]`. This is more concise, Pythonic, immutable\n(no list mutation), and clearer intent.\n",
  should_flag: true,
}
