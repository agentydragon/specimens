{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/state.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/state.py': [
          {
            end_line: 107,
            start_line: 104,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 104-107 define `start_tool()` which takes individual `tool`, `call_id` parameters\nthen fabricates a `ToolCall` object internally. This unbundles existing structure from\ncallers and loses information.\n\n**Problems:**\n1. Callers likely already have a `ToolCall` object but must unbundle it\n2. Hardcodes `args_json=None`, losing actual value\n3. Requires 4 keyword params instead of 2\n4. Function must know ToolCall internals to reconstruct it\n\n**Fix:** Accept `tool_call: ToolCall` directly instead of `tool` and `call_id` separately.\nThis preserves all fields (including args_json), reduces parameters, and respects existing\nbundling. Callers pass the ToolCall as-is without unbundling.\n\nAlternatively, if cmd/args should also be bundled, accept both `tool_call: ToolCall` and\n`content: ToolContent` for a two-parameter signature.\n',
  should_flag: true,
}
