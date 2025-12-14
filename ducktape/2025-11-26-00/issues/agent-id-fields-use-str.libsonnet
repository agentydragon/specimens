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
            end_line: 30,
            start_line: 30,
          },
          {
            end_line: 66,
            start_line: 66,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Multiple fields that semantically represent agent IDs use generic str type instead\nof the AgentID newtype from adgn.agent.types.\n\n**Two occurrences in agents_ws.py:**\n\n**1. AgentBrief.id (line 30)**\nField defined as `id: str` but semantically represents an agent ID.\n\n**2. AgentStatusData.id (line 66)**\nField defined as `id: str` but semantically represents an agent ID.\n\n**Problem with using str for typed IDs:**\n- Loss of type safety (can pass any string)\n- No semantic clarity (doesn't indicate this is specifically an agent ID)\n- Can't enforce ID format constraints\n- Harder to track ID flow through codebase\n\n**Correct approach: Use AgentID newtype**\n\nReplace `id: str` with `id: AgentID` and ensure AgentID is imported from\nadgn.agent.types. Pydantic handles NewType aliases correctly for validation and\nserialization.\n\nBenefits:\n- Type checker catches misuse (passing non-agent-ID strings)\n- Clear semantic meaning (this is specifically an agent ID)\n- Can grep for AgentID to find all agent ID usage\n- Consistent with codebase typing conventions\n",
  should_flag: true,
}
