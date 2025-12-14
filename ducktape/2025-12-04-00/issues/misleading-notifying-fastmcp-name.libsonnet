{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/notifying_fastmcp.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/exec/docker/server.py': [
          {
            end_line: 18,
            start_line: 18,
          },
        ],
        'adgn/src/adgn/mcp/git_ro/server.py': [
          {
            end_line: 28,
            start_line: 28,
          },
        ],
        'adgn/src/adgn/mcp/loop/server.py': [
          {
            end_line: 16,
            start_line: 16,
          },
        ],
        'adgn/src/adgn/mcp/notifying_fastmcp.py': [
          {
            end_line: 107,
            start_line: 107,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "`NotifyingFastMCP` inherits from `FlatModelFastMCP` (line 107 of notifying_fastmcp.py), bundling both notification support and flat model support into one class. However, the name \"Notifying\" only suggests the notification feature, hiding the fact that it also provides flat model tooling.\n\nThis creates confusion when servers inherit from `NotifyingFastMCP` but don't use notifications - developers ask \"what notifications are you emitting?\" when the answer is often \"none\". Many MCP servers in the snapshot instantiate NotifyingFastMCP purely to get flat model support, not notification broadcasting:\n\n- `loop/server.py`: `mcp = NotifyingFastMCP(name, ...)` then only uses `@mcp.flat_model()`, no broadcast calls\n- `git_ro/server.py`: imports NotifyingFastMCP, never calls any broadcast_* methods\n- `exec/docker/server.py`: `server = NotifyingFastMCP(name, ...)` for container exec, no notifications\n\nOnly `chat/server.py` and `matrix/server.py` actually use `broadcast_resource_updated()` for their intended purpose.\n\nThe inheritance hierarchy creates false coupling between two independent features (notifications and flat model support) that should be composable separately.\n",
  should_flag: true,
}
