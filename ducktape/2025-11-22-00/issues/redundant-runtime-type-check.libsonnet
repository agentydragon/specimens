{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/policy_eval/container.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/policy_eval/container.py': [
          {
            end_line: 35,
            start_line: 34,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Redundant runtime type check for parameter when type system already guarantees non-None.\n\n**Current code (container.py:34-35):**\n```python\ndef __init__(self, agent_id: AgentID, ...):\n    if not agent_id:\n        raise ValueError("ContainerPolicyEvaluator requires agent_id")\n```\n\nThe type annotation `agent_id: AgentID` (not `AgentID | None`) already guarantees\nthe parameter is provided. This check adds defensive programming noise without value.\n\n**The correct approach:**\n\nRemove the check. The type system guarantees `agent_id` is present. If you need\nto validate empty strings, add validation to the `AgentID` type itself:\n\n```python\nclass AgentID(str):\n    def __new__(cls, value: str):\n        if not value:\n            raise ValueError("AgentID cannot be empty")\n        return super().__new__(cls, value)\n```\n\nThis centralizes validation at the type level, not at every usage site.\n\n**Benefits:**\n- Less code\n- Type system is the source of truth\n- No redundant checks at call sites\n- Validation happens once (at type construction)\n',
  should_flag: true,
}
