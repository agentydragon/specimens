{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/stubs/typed_stubs.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/stubs/typed_stubs.py': [
          {
            end_line: 178,
            start_line: 109,
          },
          {
            end_line: 177,
            start_line: 128,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The from_server classmethod spans 69 lines (109-178), with a single for-loop body\nconsuming 49 lines (128-177). This makes the method difficult to understand and maintain.\n\nProblems: single method doing too many things (registry access, tool introspection,\ntype resolution, model extraction), 49-line loop body extremely hard to read, multiple\nnested try/except blocks and conditionals within loop, mixing different concerns,\nhard to test individual introspection logic pieces.\n\nExtract loop body into a static helper method _extract_tool_models(tool) that returns\ntuple[str, ToolModels] | None. Simplify main loop to call helper, check result, and\nstore. Benefits: single responsibility per method, easier to understand flow, helper\ntestable independently, reduced cognitive load.\n',
  should_flag: true,
}
