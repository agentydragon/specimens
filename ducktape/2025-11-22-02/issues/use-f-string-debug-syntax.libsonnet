{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/auth.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/auth.py': [
          {
            end_line: null,
            start_line: 99,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: null,
            start_line: 122,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Python 3.8+ supports f\"{variable=}\" syntax which is more concise than f\"variable={variable}\":\n\nauth.py line 99:\n```python\nlogger.debug(f\"Authenticated request: token → agent_id={agent_id}\")\n```\n\nserver.py line 122:\n```python\nlogger.info(f\"Infrastructure ready for agent_id={agent_id}\")\n```\n\nBoth can be shortened using the = suffix in f-strings.\n\nUse f\"{variable=}\" syntax:\n\nauth.py:\n```python\nlogger.debug(f\"Authenticated request: token → {agent_id=}\")\n```\n\nserver.py:\n```python\nlogger.info(f\"Infrastructure ready for {agent_id=}\")\n```\n\nThis is more concise and makes it clear we're debugging/logging a variable's value.\n",
  should_flag: true,
}
