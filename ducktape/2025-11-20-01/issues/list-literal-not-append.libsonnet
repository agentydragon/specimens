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
            end_line: 272,
            start_line: 268,
          },
          {
            end_line: 274,
            start_line: 274,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The code constructs `ts_output` using repeated `.append()` calls when a list literal\nwould be cleaner.\n\n**Current code (lines 268-272):**\n```python\nts_code = generate_typescript_from_schema(unified_schema, \"AgentTypes\")\nts_output = []\nts_output.append(\"// Auto-generated TypeScript types from Pydantic models\")\nts_output.append(\"// Do not edit manually - regenerate with: npm run codegen\")\nts_output.append(\"\")\nts_output.append(ts_code.strip())\n```\n\n**Should be:**\n```python\nts_code = generate_typescript_from_schema(unified_schema, \"AgentTypes\")\nts_output = [\n    \"// Auto-generated TypeScript types from Pydantic models\",\n    \"// Do not edit manually - regenerate with: npm run codegen\",\n    \"\",\n    ts_code.strip(),\n]\n```\n\n**Why list literal is better:**\n- More concise and readable\n- All elements visible at once without scanning multiple lines\n- Consistent with other list construction patterns in the file (e.g., line 90 `output: list[str] = []`)\n- No mutation - construct the list once rather than building it incrementally\n- Standard Python pattern for known list contents\n- Easier to reorder or modify elements\n\n**Context:**\nThe list is immediately consumed at line 274: `output_file.write_text(\"\\n\".join(ts_output))`,\nso there's no benefit to incremental construction.\n",
  should_flag: true,
}
