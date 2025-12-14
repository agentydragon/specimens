{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/compositor/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/compositor/server.py': [
          {
            end_line: 84,
            start_line: 82,
          },
          {
            end_line: null,
            start_line: 109,
          },
          {
            end_line: null,
            start_line: 116,
          },
          {
            end_line: null,
            start_line: 142,
          },
          {
            end_line: null,
            start_line: 143,
          },
          {
            end_line: null,
            start_line: 145,
          },
          {
            end_line: 154,
            start_line: 151,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The naming "list_changed" is ambiguous - it could refer to any list changing.\nThese handlers specifically react to resource list changes on mounted servers (MCP resources/list_changed notifications).\nThe semantic meaning is that the list of *resources* on a server changed, not some generic "list".\nAll references should use explicit "resource_list_changed" naming to clarify this contract.\nThis affects field names (_list_changed_listeners, _pending_list_changed), method names (add_list_changed_listener, _notify_list_changed, pop_recent_list_changed), and the comment at line 82.\n',
  should_flag: true,
}
