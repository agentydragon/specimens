{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/policy_gateway/middleware.py',
          'adgn/src/adgn/agent/server/runtime.py',
        ],
        [
          'adgn/src/adgn/mcp/policy_gateway/middleware.py',
          'adgn/src/adgn/agent/server/status_shared.py',
        ],
        [
          'adgn/src/adgn/mcp/policy_gateway/middleware.py',
          'adgn/src/adgn/mcp/compositor_meta/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/container.py': [
          {
            end_line: 197,
            start_line: 197,
          },
          {
            end_line: 372,
            start_line: 372,
          },
        ],
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 95,
            start_line: 90,
          },
        ],
        'adgn/src/adgn/agent/server/status_shared.py': [
          {
            end_line: 65,
            start_line: 60,
          },
        ],
        'adgn/src/adgn/mcp/compositor_meta/server.py': [
          {
            end_line: 47,
            start_line: 35,
          },
        ],
        'adgn/src/adgn/mcp/policy_gateway/middleware.py': [
          {
            end_line: 128,
            start_line: 128,
          },
          {
            end_line: 136,
            start_line: 130,
          },
          {
            end_line: 180,
            start_line: 145,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The policy gateway tracks in-flight tool calls via direct Python field access\n(_policy_gateway.has_inflight_calls()) instead of exposing state through MCP\nresources and notifications. This breaks the architectural pattern where all\nstate is accessed through MCP.\n\n**Architectural inconsistency:**\n- compositor_meta exposes mount state as MCP resources (lines 35-47)\n- AgentSession (runtime.py:90-95) and status builder (status_shared.py:60-65)\n  directly access _policy_gateway.has_inflight_calls()\n- Frontend listens to MCP notifications but can't see \"executing\" state\n\n**Problems:**\n1. Inconsistent: everything else uses MCP resources, this uses direct access\n2. Tight coupling: direct field access creates module dependencies\n3. Missing states: tool calls show only WAITING_APPROVAL vs completed, no\n   intermediate \"executing\" state\n4. Frontend can't show \"executing\" status\n\n**Fix:** Expose tool call states (pending_approval, executing, completed) as\nMCP resources. Policy gateway emits resource_updated notifications when state\nchanges. AgentSession/status read state via MCP resources instead of direct access.\n\n**Benefits:** Architectural consistency, better UI (shows executing state),\ndecoupling, tool call lifecycle fully visible through notifications.\n",
  should_flag: true,
}
