{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/event_renderer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/event_renderer.py': [
          {
            end_line: 89,
            start_line: 85,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'event_renderer.py lines 85-89 have an AttributeError fallback in _render_tool_result\nthat can never be triggered. The try-except catches AttributeError when calling\nmodel_dump() on result.content blocks, falling back to raw content.\n\nWhy unreachable: (1) CallToolResult.content (from fastmcp.client.client) contains\nMCP content types (TextContent, ImageContent, etc.), (2) all MCP content types\nare Pydantic BaseModels (from mcp.types), (3) all Pydantic models have model_dump(),\ncannot raise AttributeError, (4) FastMCP validates content via TypeAdapter before\nreaching event_renderer (calltool.py:51).\n\nThe only way AttributeError could occur: manual construction of CallToolResult\nwith non-Pydantic objects, violating type annotations. This is a programmer error\nthat should fail loudly.\n\nDelete the try-except. Keep only: data = [block.model_dump(by_alias=True) for\nblock in result.content].\n\nBenefits: Removes dead code, removes misleading comment, clearer code without\ndefensive fallback for impossible case, violations get clear errors instead of\nsilent fallback.\n',
  should_flag: true,
}
