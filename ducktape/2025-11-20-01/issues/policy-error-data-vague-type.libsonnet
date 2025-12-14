{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/policy_gateway/signals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/policy_gateway/signals.py': [
          {
            end_line: 37,
            start_line: 33,
          },
          {
            end_line: 133,
            start_line: 133,
          },
          {
            end_line: 136,
            start_line: 136,
          },
          {
            end_line: 142,
            start_line: 142,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `PolicyGatewayError` model (lines 33-37) has a `data: dict[str, Any] | None`\nfield that's too vague.\n\nField name \"data\" is generic; type `dict[str, Any]` provides no guidance on\nstructure/contents; no documentation. Usage (line 136) checks for\nPOLICY_GATEWAY_STAMP_KEY, but this isn't reflected in type or name. Unclear what\nother fields exist besides stamp key.\n\n**Fix options:**\n1. Create typed model `PolicyGatewayErrorData` with `_policy_gateway_stamp: bool`\n   field (plus other discovered fields), use as type\n2. Add Field description documenting exact contents (must contain stamp key, list\n   other specific fields)\n3. Rename to more specific name (e.g., `mcp_error_metadata`)\n\nDon't add generic documentation like \"data associated with the error\". Real\ndocumentation requires understanding what actually gets stored and documenting\nspecifics.\n",
  should_flag: true,
}
