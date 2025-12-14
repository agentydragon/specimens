{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/features/chat/channels.ts',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/features/chat/channels.ts': [
          {
            end_line: 174,
            start_line: 138,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `channels.ts` file (lines 138-174) manually defines TypeScript types for\nWebSocket messages (SessionMessage, McpMessage, ApprovalsMessage, etc.).\n\nThe codebase already has a Pydantic-to-TypeScript code generator at\n`adgn/scripts/generate_frontend_code.py` that uses `json-schema-to-typescript`,\noutputs to `adgn/agent/web/src/generated/types.ts`, and is invoked via\n`npm run codegen`.\n\nManual types create duplication, drift risk (Python changes may not reflect in\nTypeScript), and maintenance burden (schema changes require two updates).\n\n**Fix:** Find or create Python Pydantic models for SessionMessage, McpMessage,\nApprovalsMessage, PolicyMessage, UiMessage, ErrorMessage (likely in\n`adgn/agent/server/protocol.py`). Add them to `models_to_export` in\n`generate_frontend_code.py`. Run `npm run codegen`. Replace manual types in\nchannels.ts with imports from `generated/types.ts`. Keep only envelope type\nmanually defined (infrastructure, not data model).\n',
  should_flag: true,
}
