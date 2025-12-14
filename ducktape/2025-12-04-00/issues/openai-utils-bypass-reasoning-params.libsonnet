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
            end_line: 391,
            start_line: 390,
          },
          {
            end_line: 178,
            start_line: 178,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 390-391 in `BoundOpenAIModel.responses_create()` manually construct the reasoning dict:\n\n```python\nif self.reasoning_effort and "reasoning" not in kwargs:\n    kwargs["reasoning"] = {"effort": self.reasoning_effort.value}\n```\n\nThis bypasses the existing type-safe `ReasoningParams` TypedDict (defined in `openai_utils/types.py`) and duplicates conversion logic that already exists.\n\nThe codebase already has:\n- `ReasoningParams` TypedDict with `effort` and `summary` fields (types.py)\n- `ResponsesRequest.reasoning: ReasoningParams | None` field (line 178)\n- `build_reasoning_params()` helper function for constructing ReasoningParams (types.py)\n- `to_kwargs()` which calls `model_dump()` and would automatically serialize ReasoningParams\n\nThe manual dict construction is redundant and type-unsafe. Instead, `BoundOpenAIModel` should either:\n1. Construct a proper `ReasoningParams` object and inject it into the request before calling `to_kwargs()`, OR\n2. Let callers pass the reasoning params in the ResponsesRequest (which already has the field)\n\nManual dict manipulation after `to_kwargs()` bypasses the type system and creates maintenance burden.\n',
  should_flag: true,
}
