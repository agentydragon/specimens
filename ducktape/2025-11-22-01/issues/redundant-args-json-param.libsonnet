{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: 265,
            start_line: 261,
          },
          {
            end_line: 280,
            start_line: 276,
          },
          {
            end_line: 305,
            start_line: 305,
          },
          {
            end_line: 334,
            start_line: 334,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 261-265 define `_invoke()` with parameters `function_call: FunctionCallItem` and\n`args_json: str | None`. Call sites (lines 305, 334) always pass `args_json` as\n`function_call.arguments`, making it redundant. Lines 276-280 parse `args_json` but could\nuse `function_call.arguments` directly.\n\nThis creates data duplication (same data passed twice), cognitive load (reader must verify\nargs_json matches function_call.arguments), and potential inconsistency (nothing enforces\nequality). Arguments already accessible via function_call object.\n\nRemove `args_json` parameter from `_invoke()` signature (lines 261-265). Replace `if args_json:`\ncheck (line 277) with `if function_call.arguments:`. Update call sites (lines 305, 334) to pass\nonly `function_call`. Establishes single source of truth, simpler signature, and type safety.\n',
  should_flag: true,
}
