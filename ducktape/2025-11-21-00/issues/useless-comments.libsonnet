{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
        [
          'adgn/src/adgn/agent/persist/__init__.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 792,
            start_line: 785,
          },
          {
            end_line: 785,
            start_line: 785,
          },
          {
            end_line: 787,
            start_line: 787,
          },
          {
            end_line: 788,
            start_line: 788,
          },
          {
            end_line: 790,
            start_line: 790,
          },
          {
            end_line: 791,
            start_line: 791,
          },
        ],
        'adgn/src/adgn/agent/persist/__init__.py': [
          {
            end_line: 98,
            start_line: 90,
          },
          {
            end_line: 93,
            start_line: 93,
          },
          {
            end_line: 109,
            start_line: 101,
          },
          {
            end_line: 104,
            start_line: 104,
          },
          {
            end_line: 123,
            start_line: 123,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Comments that add no value: either restating obvious code or providing\nincorrect information about field requirements.\n\n**Pattern 1: Obvious operation comments** (agents.py:785-792)\nLines 785-792 have three comments that merely restate simple operations:\ngenerating an agent ID, calling create_agent, and returning a brief.\nFunction already has a docstring; these add noise without information.\n\n**Pattern 2: Incorrect \"REQUIRED\" comments** (persist/__init__.py)\nThree Pydantic models claim \"All fields are REQUIRED\" but have optional\nfields with defaults (e.g., Decision.reason has default None). Pydantic\ntype annotations already define requirements; comments contradict the code.\n\n**Problems:**\n- Noise obscures actual code\n- Comments become stale/incorrect as code evolves\n- Redundant: code and type annotations already show what's required\n- Maintenance burden keeping comments synchronized\n\n**Fix:** Delete these comments. Code operations and Pydantic annotations\nare self-documenting. Comments should explain WHY, not restate WHAT.\n",
  should_flag: true,
}
