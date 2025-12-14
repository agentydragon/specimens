{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 810,
            start_line: 796,
          },
          {
            end_line: 800,
            start_line: 798,
          },
          {
            end_line: 806,
            start_line: 802,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `delete_agent` docstring (lines 796-810) is unnecessarily verbose, restating obvious\ninformation.\n\nSummary "Delete an agent and clean up its infrastructure" is clear and sufficient. Elaboration\n"Removes the agent from the registry, closes all running infrastructure, and releases associated\nresources" just expands on "clean up" - implied by deletion. Statement "The agent can no longer\nbe accessed after deletion" is what deletion means (like "After you delete a file, the file is\ndeleted"). Args section "agent_id: ID of the agent to delete" restates parameter name and\nfunction name, provides zero new information. Returns section "SimpleOk confirming successful\ndeletion" is obvious from return type and function name.\n\nOnly the Raises section (KeyError when agent not found) adds information and should be kept.\n\nRecommended: Keep only summary line and Raises section (4 lines instead of 15). Focuses on\nessential information, no redundant content, easier to read and maintain.\n',
  should_flag: true,
}
