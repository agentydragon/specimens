{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/resources/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/resources/server.py': [
          {
            end_line: null,
            start_line: 386,
          },
          {
            end_line: null,
            start_line: 413,
          },
          {
            end_line: 52,
            start_line: 51,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 386 and 413 define subscribe/unsubscribe tools that use ResourcesReadArgs as their input type. However, ResourcesReadArgs includes windowing parameters (start_offset and max_bytes on lines 51-52) that are only relevant for reading resources, not for subscribing/unsubscribing.\n\nThe subscribe and unsubscribe tools only use input.server and input.uri - they never access the windowing parameters. These tools should use a separate, simpler input type (e.g., ResourceSubscriptionArgs) with just server and uri fields, making the tool interface clearer and avoiding unnecessary parameters.\n',
  should_flag: true,
}
