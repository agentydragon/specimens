{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: null,
            start_line: 554,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Using TypeAdapter wrapper unnecessarily for Pydantic model validation. Pydantic BaseModel classes have model_validate_json() class method that is more direct and idiomatic.\n\nCurrent: TypeAdapter(mcp_types.CallToolResult).validate_json(item.output)\n\nBetter: mcp_types.CallToolResult.model_validate_json(item.output)\n',
  should_flag: true,
}
