{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte': [
          {
            end_line: 85,
            start_line: 85,
          },
        ],
      },
      note: 'Creates MCP client to list agents; should use shared client from store/context',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/ChatPane.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/ChatPane.svelte': [
          {
            end_line: 91,
            start_line: 87,
          },
          {
            end_line: 128,
            start_line: 124,
          },
        ],
      },
      note: 'Creates TWO separate clients in same component: chat-pane-client (line 87-91) for listing, chat-pane-abort-client (line 124-128) for aborting. Worst offender - not even reusing its own client',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/MessageComposer.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/MessageComposer.svelte': [
          {
            end_line: 20,
            start_line: 16,
          },
        ],
      },
      note: 'Creates new MCP client per message send operation; should use shared client',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/GlobalApprovalsList.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/GlobalApprovalsList.svelte': [
          {
            end_line: 71,
            start_line: 69,
          },
        ],
      },
      note: 'Creates separate client targeting /api/mcp (non-existent endpoint). Violates 2-level compositor architecture. User suggests: delete component or expose agent-global resource through compositor',
      occurrence_id: 'occ-3',
    },
  ],
  rationale: "Four Svelte components create independent MCP client connections: AgentsSidebar (line 85), ChatPane\n(lines 87-91 and 124-128 - TWO separate clients in same component), MessageComposer (lines 16-20),\nand GlobalApprovalsList (lines 69-71 targeting non-existent /api/mcp endpoint).\n\nEach client creation involves handshake, auth, session setup, and dedicated connection. This wastes\nresources (multiple WebSocket/HTTP connections, repeated handshakes, memory/file descriptors), violates\n2-level compositor architecture (intended: UI → shared client → compositor; actual: parallel connections),\ncreates inconsistent state (separate sessions don't coordinate, race conditions), and duplicates connection\nmanagement (multiple reconnection paths, error handling, token refresh).\n\nCreate global MCP client store/context (e.g., `stores/mcp-client.ts` with `mcpClient` writable), initialize\nonce at app startup, and have all components import and use the shared client. This provides single connection,\nconsistent state, centralized reconnection, and proper resource subscriptions.\n\nGlobalApprovalsList: delete component until backend supports it, or expose global approvals through shared compositor.\n",
  should_flag: true,
}
