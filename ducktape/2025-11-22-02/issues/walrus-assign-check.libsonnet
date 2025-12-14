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
            end_line: 76,
            start_line: 75,
          },
          {
            end_line: 114,
            start_line: 113,
          },
          {
            end_line: 148,
            start_line: 144,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 89,
            start_line: 85,
          },
          {
            end_line: 173,
            start_line: 172,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Multiple locations assign a variable and immediately test it, where the walrus\noperator (:=) would combine assignment and conditional test more idiomatically.\n\n**Pattern 1: HTTP header extraction with check** (auth.py:75-76, 113-114, 144-148):\nauth_header = request.headers.get(\"Authorization\")\nif not auth_header:\n    raise HTTPException(...)\n\nShould use: if not (auth_header := request.headers.get(\"Authorization\")):\n\nenv_token = os.environ.get(\"ADGN_UI_TOKEN\")\nif env_token:\n    return env_token\n\nShould use: if env_token := os.environ.get(\"ADGN_UI_TOKEN\"):\n\n**Pattern 2: Single-use builder variable** (server.py:85-89):\nbuilder = MCPInfrastructure(\n    agent_id=agent_id,\n    persistence=persistence,\n    docker_client=docker_client,\n    initial_policy=initial_policy\n)\nreturn await builder.start(mcp_config)\n\nShould inline: return await MCPInfrastructure(...).start(mcp_config)\n\nOr if clarity matters, use walrus in await:\nreturn await (builder := MCPInfrastructure(...)).start(mcp_config)\n\n**Pattern 3: Get agent and check** (server.py:172-173):\nagent = self._agents[agent_id].agent\nif agent is None:\n    raise KeyError(...)\n\nShould use: if (agent := self._agents[agent_id].agent) is None:\n\nBenefits of walrus operator (PEP 572):\n- More concise: one line instead of two\n- Clear intent: we're testing the retrieved value\n- Modern Python idiom (introduced in Python 3.8)\n- Variable scope is explicit: only exists where needed\n\nBenefits of inlining single-use variables:\n- Reduces temporary variables that add no semantic value\n- Makes data flow more obvious\n- Less cognitive overhead (fewer names to track)\n",
  should_flag: true,
}
