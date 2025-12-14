{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/calltool.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/calltool.py': [
          {
            end_line: null,
            start_line: 56,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Function extract_structured_content accepts both FMCallToolResult and mcp_types.CallToolResult, making type reasoning harder.\nThis loose typing forces runtime normalization and isinstance checks throughout the function.\nThe function should accept only mcp_types.CallToolResult, and callers should explicitly convert using fastmcp_to_mcp_result if needed.\nThis pushes the conversion to the boundary, making the core logic simpler and type-safe.\n',
  should_flag: true,
}
