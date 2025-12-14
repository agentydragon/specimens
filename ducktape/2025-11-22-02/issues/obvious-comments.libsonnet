{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: null,
            start_line: 319,
          },
          {
            end_line: null,
            start_line: 346,
          },
        ],
      },
      note: 'Lines 319, 346: "Call persistence to get ACTUAL ID", "Create proposal and get actual database-assigned ID"',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: null,
            start_line: 421,
          },
          {
            end_line: null,
            start_line: 459,
          },
        ],
      },
      note: 'Lines 421, 459: "Generate or use provided UI token", "Health check endpoint"',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: "Comments state obvious facts that are already clear from method names, types,\nand code structure.\n\nExamples:\n- \"Call persistence to get ACTUAL ID\" followed by `policy_id = await self._persistence.set_policy(...)`\n- \"Create proposal and get actual database-assigned ID\" followed by `proposal_id = await self._persistence.create_policy_proposal(...)`\n- \"Generate or use provided UI token\" followed by `if ui_token is None: ui_token = generate_ui_token()`\n\nProblems:\n- Obviously calling persistence (visible in code)\n- Obviously getting IDs (clear from method names and return types)\n- Just restates what's visually apparent\n- If clarification is needed, should explain WHY, not WHAT\n\nDelete these comments. Method names and code structure are sufficient.\n",
  should_flag: true,
}
