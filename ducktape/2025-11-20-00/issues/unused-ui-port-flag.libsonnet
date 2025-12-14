{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/cli.py': [
          {
            end_line: null,
            start_line: 63,
          },
          {
            end_line: null,
            start_line: 72,
          },
          {
            end_line: null,
            start_line: 103,
          },
          {
            end_line: null,
            start_line: 116,
          },
          {
            end_line: null,
            start_line: 160,
          },
          {
            end_line: null,
            start_line: 161,
          },
          {
            end_line: null,
            start_line: 166,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 270,
            start_line: 260,
          },
          {
            end_line: 289,
            start_line: 283,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The --ui-port flag is defined and accepted but misleads users about a non-existent Management UI.\n\nIn single-agent mode: the flag is completely unused (no UI app created).\nIn multi-agent mode: the flag binds a stub FastAPI app with unimplemented features:\n- WebSocket at /ws/mcp returns \"not_implemented\" (server.py:287-289)\n- No web frontend exists (no HTML/JS/Svelte files for \"Management UI\")\n\nLog messages compound the problem:\n- \"Management UI: http://{host}:{ui_port}\" - suggests functional UI (doesn't exist)\n- \"MCP: ws://{host}:{ui_port}/ws/mcp\" - suggests working WebSocket (unimplemented)\n\nThe flag's only functional use is binding uvicorn (cli.py:166), but the server serves\nnothing beyond stubs and proxies. This creates unnecessary complexity (two ports instead\nof one) and false expectations about Management UI capabilities.\n\nFix: Remove --ui-port flag. Either implement the promised UI or consolidate all endpoints\nonto mcp-port.\n",
  should_flag: true,
}
