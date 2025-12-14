{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/scripts/generate_frontend_code.py',
        ],
      ],
      files: {
        'adgn/scripts/generate_frontend_code.py': [
          {
            end_line: 186,
            start_line: 183,
          },
          {
            end_line: 250,
            start_line: 250,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `get_json_schema` helper function (lines 183-186) has exactly one call site and should\nbe inlined and deleted.\n\n**Current code:**\n```python\ndef get_json_schema(model: type) -> dict[str, Any]:\n    \"\"\"Get JSON Schema for a Pydantic model.\"\"\"\n    adapter = TypeAdapter(model)\n    return adapter.json_schema(mode=\"serialization\")\n```\n\nCalled at line 250: `schema = get_json_schema(model_class)`\n\n**Should be inlined to:**\n```python\n# At line 250:\nschema = TypeAdapter(model_class).json_schema(mode=\"serialization\")\n```\n\n**Why inline:**\n- Single call site at line 250 (within `generate_pydantic_types`)\n- Simple 2-line function with no complex logic\n- The `adapter` intermediate variable is only used once, so it should be inlined too\n- Function name doesn't add semantic clarity beyond the chained method call\n- Reduces indirection - the inline version is just as readable\n- TypeAdapter is already imported, so no additional imports needed\n\n**After inlining:**\nDelete the `get_json_schema` function entirely (lines 183-186).\n",
  should_flag: true,
}
