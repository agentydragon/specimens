{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/protocol.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/protocol.py': [
          {
            end_line: null,
            start_line: 36,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 36 in server/protocol.py contains a useless comment:\n\"## Tests summary/error model shared in adgn.agent.models.policy_error\"\n\nThis comment should be deleted because:\n\n1. It merely states that something is \"shared\" elsewhere without explaining:\n   - WHY it is shared\n   - WHAT specific aspects are shared\n   - WHAT implications this sharing has\n\n2. The location reference adds no value:\n   - If you need to find where something is used/imported, use grep or IDE navigation\n   - Imports already document dependencies\n   - This comment will become stale if the code moves\n\n3. It's unclear what \"Tests summary/error model\" even refers to without context\n\nComments that just point to other locations or state \"this is shared\" without\nexplaining the reasoning, implications, or design decisions add noise without\nvalue. Either explain WHY something is shared (design rationale, constraints,\ntrade-offs) or remove the comment entirely.\n",
  should_flag: true,
}
