{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/GlobalApprovalsList.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/GlobalApprovalsList.svelte': [
          {
            end_line: 36,
            start_line: 29,
          },
          {
            end_line: 121,
            start_line: 115,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 29-36 define `parseArgs()` using manual `JSON.parse()` that returns `{}` on error (silent\nfailure). Lines 115-121 manually parse approval blocks with `JSON.parse()`, destructuring\n`agent_id`, `tool_call`, `timestamp` without validation.\n\nManual JSON parsing loses: (1) validation (accepts any JSON structure), (2) type safety\n(`Record<string, unknown>` doesn't match actual shape), (3) error visibility (parseArgs\nsilently returns empty object), (4) schema checking (can't detect missing/extra fields).\n\nBackend has `ToolCall` Pydantic model (agent/types.py:20-25) with `name`, `call_id`,\n`args_json` fields. Frontend should use Zod schemas generated from Pydantic models via\n`adgn/scripts/generate_types.py` (commit 7c6cae7ad) extended with `json-schema-to-zod`.\n\nReplace `JSON.parse()` with `PendingApprovalSchema.parse(data)` for runtime validation,\ndetailed error messages, and single source of truth (Backend Pydantic → Frontend Zod).\n",
  should_flag: true,
}
