{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/registry.py',
        ],
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/registry.py': [
          {
            end_line: 27,
            start_line: 27,
          },
        ],
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 12,
            start_line: 11,
          },
          {
            end_line: 54,
            start_line: 54,
          },
          {
            end_line: 77,
            start_line: 62,
          },
          {
            end_line: 90,
            start_line: 79,
          },
          {
            end_line: 109,
            start_line: 93,
          },
          {
            end_line: 135,
            start_line: 135,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The codebase contains extensive WebSocket-related code and documentation that is no longer used because WebSocket endpoints are no longer mounted.\n\n**Problem 1: Outdated documentation in AgentRuntime**\n\nThe `AgentRuntime` docstring (registry.py line 27) describes `_ui_manager` as a "WebSocket connection manager", but WebSocket endpoints no longer exist. The ConnectionManager is now used for sending messages via ServerBus, not actual WebSocket connections.\n\nUpdate documentation to reflect current usage: "Connection manager for UI message delivery (optional)" or rename `_ui_manager` to something more accurate like `_message_sender` or `_ui_connection`.\n\n**Problem 2: Dead WebSocket code in ConnectionManager**\n\nThe `ConnectionManager` class in `runtime.py` has extensive WebSocket-related code (imports, methods, fields) that is never used:\n\n**Dead code includes:**\n- WebSocket imports (lines 11-12): `from fastapi import WebSocket`, `from starlette.websockets import WebSocketState`\n- `_clients` field (line 54): `dict[int, tuple[WebSocket, asyncio.Queue[Any | None], asyncio.Task]]`\n- `connect()` method (lines 62-77): accepts and registers WebSocket connections\n- `disconnect()` method (lines 79-90): unregisters WebSocket connections\n- `_sender_loop()` method (lines 93-109): sends messages over WebSocket\n- Comment (line 135): "Run status mirroring removed with WebSocket status broadcasts"\n\n**Evidence these are dead:**\n1. No WebSocket endpoints mounted (no `@app.websocket(...)` decorators)\n2. `connect()` and `disconnect()` methods never called\n3. `_sender_loop()` never called (runs when client connects)\n4. No imports of `ConnectionManager.connect` or `.disconnect`\n\n**Correct approach:**\n\nRemove all WebSocket-specific code. The ConnectionManager should focus on its current purpose: managing message delivery to UI clients via ServerBus. Version control already has the history if WebSocket support needs to be restored.\n\nOptionally rename `ConnectionManager` to `MessageSender` or `UiEventEmitter` to reflect its actual purpose.\n',
  should_flag: true,
}
