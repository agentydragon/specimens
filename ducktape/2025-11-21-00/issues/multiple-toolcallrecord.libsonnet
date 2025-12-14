{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/policy_gateway/middleware.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/policy_gateway/middleware.py': [
          {
            end_line: 358,
            start_line: 142,
          },
          {
            end_line: 158,
            start_line: 150,
          },
          {
            end_line: 188,
            start_line: 180,
          },
          {
            end_line: 205,
            start_line: 195,
          },
          {
            end_line: 271,
            start_line: 263,
          },
          {
            end_line: 286,
            start_line: 278,
          },
          {
            end_line: 310,
            start_line: 302,
          },
          {
            end_line: 327,
            start_line: 317,
          },
          {
            end_line: 347,
            start_line: 339,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `on_call_tool` method constructs 8 independent ToolCallRecord instances at lines 150-158,\n180-188, 195-205, 263-271, 278-286, 302-310, 317-327, and 339-347, each repeating the same\n4-7 field assignments (call_id, run_id, agent_id, tool_call, decision, execution).\n\nThis massive code duplication (~100 lines of redundancy) violates DRY. Field assignments\nobscure the actual state transitions (PENDING → EXECUTING → COMPLETED, or DENIED paths).\nWhen fields change, all 8 constructions must be updated, making maintenance error-prone.\n\nCreate ONE mutable ToolCallRecord instance at the start. At each state transition, update only\nthe changed fields (set .decision or .execution), then save. This eliminates redundancy, makes\nstate transitions explicit, and ensures single source of truth for record fields.\n\nRequires ToolCallRecord to be mutable (dataclass with frozen=False, or Pydantic with frozen=False).\n',
  should_flag: true,
}
