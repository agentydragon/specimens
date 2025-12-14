{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 177,
            start_line: 177,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 177 in server/app.py contains a useless comment:\n"# Create middleware instance"\n\nThis comment should be deleted because:\n\n1. The code immediately following is self-documenting:\n   middleware = MCPRoutingMiddleware(...)\n\n2. The comment merely restates what the code obviously does (assigns to a\n   variable named "middleware" by calling a constructor named\n   "MCPRoutingMiddleware")\n\n3. It provides no additional context, reasoning, or non-obvious information\n\nComments that simply restate what the code does add noise without value.\nOnly keep comments that explain WHY (intent/reasoning) or document\nnon-obvious aspects, not WHAT (which should be clear from the code itself).\n',
  should_flag: true,
}
