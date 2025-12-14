{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/openai_utils/model.py',
        ],
      ],
      files: {
        'adgn/src/adgn/openai_utils/model.py': [
          {
            end_line: 357,
            start_line: 348,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `responses` property (lines 348-357) in `OpenAIModel` is dead code. It provides a `.responses.create()` interface that wraps `responses_create()`, but this property is never used anywhere in the codebase.\n\nEvidence:\n- `BoundOpenAIModel` (line 376), which implements the `OpenAIModelProto` protocol, only implements `responses_create()` (line 386), not the `responses` property\n- The protocol `OpenAIModelProto` (line 401) only requires `responses_create()`, not `responses`\n- No code in the codebase calls `.responses.create()`\n- All consumers use `responses_create()` directly\n\nThe property adds complexity (nested class `_Compat`, cast) without providing any value. Delete the entire property.\n',
  should_flag: true,
}
