{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/auth.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/auth.py': [
          {
            end_line: 99,
            start_line: 99,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The logger.debug call manually constructs the debug message when f-string debug format\nis more concise.\n\n**Current code (line 99):**\n```python\nlogger.debug(f\"Authenticated request: token → agent_id={agent_id}\")\n```\n\n**Should be:**\n```python\nlogger.debug(f\"Authenticated request: {agent_id=}\")\n```\n\n**Why f-string debug format is better:**\n- More concise: no need to repeat \"agent_id=\" twice\n- Self-documenting: shows both variable name and value\n- Standard Python 3.8+ debugging pattern\n- Less error-prone: can't accidentally mismatch variable name in string\n\n**Example output:**\n- Current: `Authenticated request: token → agent_id=chatgpt-agent`\n- Proposed: `Authenticated request: agent_id='chatgpt-agent'`\n\nThe debug format automatically adds quotes around string values, making it clearer\nwhat the actual value is (especially useful for empty strings, whitespace, etc.).\n\n**Note:** The \"token →\" prefix doesn't add value since we're not logging the actual\ntoken (for security reasons). The {agent_id=} format is sufficient.\n",
  should_flag: true,
}
