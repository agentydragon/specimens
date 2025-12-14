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
            end_line: 352,
            start_line: 343,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Method _fm_transport_from_spec at lines 343-352 is an instance method but accesses no instance state.\nIt's a pure transformation function: MCPServerTypes → ClientTransport.\nThis should be a module-level function outside the class, not a method.\nAs a free function, it's easier to test in isolation and signals that it has no side effects or class dependencies.\n",
  should_flag: true,
}
