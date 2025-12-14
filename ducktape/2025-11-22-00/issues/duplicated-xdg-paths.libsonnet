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
            end_line: 36,
            start_line: 36,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The code constructs XDG user data directory paths (using `user_data_dir(\"adgn\", ...)`)\nin multiple places instead of defining these paths once in a central location.\n\n**Current implementation:** Each module independently calls `user_data_dir(\"adgn\", \"agentydragon\")`\nand constructs paths like `DEFAULT_DB_PATH = Path(...) / \"mcp-bridge.db\"` (mcp_bridge/cli.py, line 36).\n\n**Problems:**\n1. Duplication: Same platformdirs call in multiple files\n2. Inconsistency risk: Easy to use different app name/author\n3. Hard to change: Must update multiple files\n4. No discoverability: Can't easily find all data paths\n5. Testing difficulty: Can't easily override base directory\n\n**The correct approach:**\nCreate a central paths module (e.g., `adgn/paths.py`) that defines XDG directories once\n(USER_DATA_DIR, USER_CACHE_DIR, USER_CONFIG_DIR) and specific application paths\n(MCP_BRIDGE_DB, RESPONSES_CACHE_DB, AUTH_TOKENS_FILE, etc.). Import these constants\nthroughout the codebase.\n\n**Benefits:**\n1. Single source of truth for all paths\n2. Guaranteed consistency in app name/author\n3. Easy to add environment variable overrides once\n4. Testable: can patch the paths module\n5. Follows XDG Base Directory Specification correctly across platforms\n",
  should_flag: true,
}
