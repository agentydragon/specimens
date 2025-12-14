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
            end_line: 258,
            start_line: 255,
          },
          {
            end_line: 291,
            start_line: 291,
          },
          {
            end_line: 293,
            start_line: 293,
          },
          {
            end_line: 298,
            start_line: 296,
          },
          {
            end_line: 335,
            start_line: 333,
          },
          {
            end_line: 336,
            start_line: 336,
          },
          {
            end_line: 305,
            start_line: 305,
          },
          {
            end_line: 310,
            start_line: 310,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 255-258 build `calls: list[tuple[FunctionCallItem, str | None]]` duplicating\n`function_call.arguments` when it's already in the `FunctionCallItem` object.\n\nCurrent: constructs tuples `(function_call, function_call.arguments)`, then passes\nboth `calls` (tuples) and `function_calls` (original list) to\n`_run_tool_calls_parallel` and `_run_tool_calls_sequential` (lines 291, 293).\n\nSequential usage (line 336): `for i, (function_call, args_json) in enumerate(calls):`\nthen `invoker(function_call, args_json)`. Could iterate `function_calls` directly\nand access `function_call.arguments`.\n\nParallel usage (line 305): `runner(fc: FunctionCallItem, aj: str | None)` then\nunpacks tuples at line 310. Could take only `FunctionCallItem` and access\n`fc.arguments` inside.\n\n**Fix:** Delete tuple construction, pass only `function_calls` to both methods,\naccess `.arguments` directly, remove tuple unpacking. Benefits: no duplication,\nsimpler code, one less list, clearer that we're working with objects.\n",
  should_flag: true,
}
