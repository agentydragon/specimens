{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/ToolExec.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/ToolJson.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/ChatPane.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/ChatPane.svelte': [
          {
            end_line: 92,
            start_line: 84,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ToolExec.svelte': [
          {
            end_line: 8,
            start_line: 8,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ToolJson.svelte': [
          {
            end_line: 9,
            start_line: 9,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Frontend components use manual type guards and type assertions instead of runtime\nvalidation with Zod schemas.\n\n**Pattern 1 (ToolExec.svelte, ToolJson.svelte lines 8-9):** Manual string comparison\n`if (content_kind === 'Exec')` without validating structure.\n\n**Pattern 2 (ChatPane.svelte lines 84-92):** `JSON.parse(text) as AgentList` uses\ncompile-time-only type assertion.\n\n**Problems:**\n- Type assertions don't validate at runtime; invalid JSON causes silent failures\n- TypeScript types can drift from Python Pydantic models\n- Poor error messages (generic instead of field-level validation details)\n- Maintaining parallel type definitions is error-prone\n\n**Fix:** Extend `adgn/scripts/generate_frontend_code.py` to output Zod schemas\nalongside TypeScript types. Generator already produces JSON Schema via\n`TypeAdapter(model).json_schema()`; use `json-schema-to-zod`\n(https://www.npmjs.com/package/json-schema-to-zod) to convert to Zod code.\n\nReplace `JSON.parse(text) as Type` with `TypeSchema.safeParse(JSON.parse(text))`;\ncheck `result.success` and use `result.data`. Discriminated unions will validate\nand narrow correctly via `z.discriminatedUnion()`.\n\nBenefits: runtime safety, single source of truth (Pydantic → Zod), detailed\nvalidation errors, automatic regeneration on schema changes.\n",
  should_flag: true,
}
