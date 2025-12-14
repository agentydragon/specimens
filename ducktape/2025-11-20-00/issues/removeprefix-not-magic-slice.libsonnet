{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/mcp_routing.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/mcp_routing.py': [
          {
            end_line: 73,
            start_line: 72,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Code strips \"Bearer \" prefix using magic number slice (mcp_routing.py:72-73):\n\nif auth_value.startswith(\"Bearer \"):\n    return auth_value[7:]  # Strip \"Bearer \" prefix\n\nProblems:\n- Magic number 7: not self-documenting\n- Fragile: if prefix changes, must update both check and slice\n- Duplicates prefix string literal\n\nShould use removeprefix (Python 3.9+):\nBEARER_PREFIX = \"Bearer \"\nif auth_value.startswith(BEARER_PREFIX):\n    return auth_value.removeprefix(BEARER_PREFIX)\n\nOr simpler:\nif auth_value.startswith(BEARER_PREFIX):\n    return auth_value[len(BEARER_PREFIX):]\n\nBest: just use removeprefix unconditionally if you know it's there:\nBEARER_PREFIX = \"Bearer \"\n# After checking startswith:\nreturn auth_value.removeprefix(BEARER_PREFIX)\n\nBenefits:\n- Self-documenting: removeprefix clearly shows intent\n- DRY: prefix defined once as constant\n- Safer: removeprefix is no-op if prefix not present\n- Standard Python idiom\n\nConstant should be module-level for reuse across auth code.\n",
  should_flag: true,
}
