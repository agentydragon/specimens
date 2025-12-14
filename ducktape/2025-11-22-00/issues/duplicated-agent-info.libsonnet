{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 279,
            start_line: 252,
          },
          {
            end_line: 302,
            start_line: 285,
          },
          {
            end_line: 198,
            start_line: 187,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The code has two problems in server.py:\n\n**Problem 1: Duplicated agent info construction**\n\nBoth `list_agents()` and `get_agent_info()` build the same `AgentInfo` object with identical\nlogic (determine run phase, check mode, build capabilities), but the implementation is\nduplicated line-by-line instead of extracting a shared helper (server.py, lines 252-302).\n\n**The correct approach:**\nExtract a `_build_agent_info(agent_id, agent)` helper method and call it from both resources.\nAlternatively, have `list_agents` call `get_agent_info` for each agent.\n\n**Problem 2: Thin wrapper methods**\n\nMethods `get_infrastructure()`, `get_agent_mode()`, and `get_local_runtime()` are trivial\nwrappers that just call `_get_agent_or_raise()` and access one field (server.py, lines 187-198).\n\n**The correct approach:**\nLet callers use `_get_agent_or_raise()` directly and access fields themselves\n(`agent.running`, `agent.mode`, `agent.local_runtime`). Or if public access is needed,\nrename `_get_agent_or_raise` to `get_agent` and let callers access fields directly.\n\n**Benefits:**\n1. Less code duplication (single agent info construction)\n2. Easier maintenance (one place for changes)\n3. Simpler API (fewer methods, clearer responsibilities)\n4. More direct (no unnecessary jumps between wrapper methods)\n5. Better testability (can test helper independently)\n\n**Why thin wrappers are harmful:**\nThey add noise without meaningful abstraction, increase maintenance burden, and make it harder\nto see what's actually being accessed.\n",
  should_flag: true,
}
