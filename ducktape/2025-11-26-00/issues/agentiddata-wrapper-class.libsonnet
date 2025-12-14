{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/agents_ws.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/agents_ws.py': [
          {
            end_line: 50,
            start_line: 48,
          },
          {
            end_line: null,
            start_line: 55,
          },
          {
            end_line: null,
            start_line: 61,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'AgentIdData is a useless single-field wrapper class (lines 48-50).\n\nThe class wraps a single id field and is used in AgentCreatedMsg.data and\nAgentDeletedMsg.data (lines 55, 61). Single-field wrappers provide no value.\nPydantic understands NewType aliases like AgentID, so use AgentID directly.\n\nReplace AgentCreatedMsg.data and AgentDeletedMsg.data types with AgentID directly,\nor rename the field to agent_id: AgentID for clarity. Delete the AgentIdData class.\n',
  should_flag: true,
}
