{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 110,
            start_line: 96,
          },
          {
            end_line: 195,
            start_line: 146,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 258,
            start_line: 1,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 932,
            start_line: 1,
          },
          {
            end_line: 932,
            start_line: 833,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The agents MCP bridge uses a complex two-layer observer pattern (business logic → callbacks\n→ AgentsServer → MCP clients) instead of the simpler compositor pattern already used\nsuccessfully on the agent side.\n\n**Current Architecture Problems:**\n\n1. **Two-layer complexity:** Business logic calls sync callbacks that schedule async tasks\n   that eventually broadcast. Lines 833-932 contain ~100 lines of factory functions.\n\n2. **Clobbered notifier bug (Issue 037):** ApprovalPolicyEngine has only ONE notifier slot.\n   When agents.py:855 wires its notifier, it replaces the one from ApprovalPolicyServer,\n   breaking notifications.\n\n3. **Monolithic server:** AgentsServer aggregates resources from 6+ business logic classes.\n   Hard to test independently.\n\n4. **URI scoping inconsistency (Issue 038):** Global URIs (`resource://approval-policy/*`)\n   mixed with agent-scoped URIs (`resource://agents/{id}/*`).\n\n**Better: Compositor Pattern**\n\nReplace monolithic AgentsServer with small focused servers mounted in a compositor, like\nthe agent-side does (agent/runtime/infrastructure.py:100-114). Each server wraps one\nbusiness logic class and directly broadcasts MCP notifications.\n\nExample structure:\n- ApprovalPolicyServer wraps ApprovalPolicyEngine\n- ApprovalsServer wraps ApprovalHub\n- SessionStateServer wraps Session\n- AgentRegistryServer wraps AgentRegistry\n\nMount all in compositor with proper namespacing (`agent_{id}_policy`, etc.). Notifications\npropagate automatically via compositor's _ChildHandler (compositor/server.py:446-469).\n\n**Benefits:**\n\n- Eliminates callback layer - servers directly broadcast to MCP clients\n- Fixes clobbered notifier bug - each server manages its own subscriptions\n- Natural namespacing via server prefixes\n- Eliminates 100 lines of manual wiring code (lines 833-932)\n- Independently testable without mocking callbacks\n- Reuses proven pattern from agent-side\n- Dynamic mounting via compositor API\n\n**Refactoring needed:**\n\n- agents.py (833 lines) → Replace with small server files\n- server.py → Use compositor instead of single FastAPI app\n- Business logic classes → Remove notifier fields, add `*_without_notify()` methods\n- Lines 833-932 → Delete wiring code, mount servers in compositor\n\n**Related:** Issues 036 (notification wiring duplication), 037 (notifier pattern bugs),\n038 (URI scoping). All solved by compositor pattern.\n",
  should_flag: true,
}
