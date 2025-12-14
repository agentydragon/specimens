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
            end_line: 89,
            start_line: 86,
          },
        ],
      },
      note: '--mcp-config flag: silent fallback to empty config MCPConfig(mcpServers={})',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/cli.py': [
          {
            end_line: 93,
            start_line: 92,
          },
        ],
      },
      note: '--initial-policy flag: silent fallback to None',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: "When user provides explicit config file flags (--mcp-config or --initial-policy) with\nnon-existent file paths, the code silently falls back without error messages.\n\nPattern (applies to both flags):\n- Check if file exists\n- If not: use fallback value (empty config or None)\n- Server starts successfully\n- User doesn't know their config wasn't loaded\n\nThis is problematic because:\n- User explicitly specified config file (not optional/auto-detected)\n- Non-existence likely indicates user error (typo, wrong directory, deleted file)\n- Silent fallback masks the problem\n- User discovers issue later when expected configuration is missing\n\nCorrect behavior (per user):\nOption 1: Remove exists() check, let FileNotFoundError propagate naturally\nOption 2: Explicitly check and report: raise click.UsageError(f\"Config file not found: {path}\")\n\nBoth approaches fail fast at startup with clear feedback, rather than starting in wrong state.\n",
  should_flag: true,
}
