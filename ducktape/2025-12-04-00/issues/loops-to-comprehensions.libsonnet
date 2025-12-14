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
            end_line: 225,
            start_line: 221,
          },
        ],
      },
      note: 'Loop building dict with condition should be dict comprehension: {k: v.spec for k, v in self._mounts.items() if v.spec is not None}',
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Imperative loops that build collections by accumulating items should be replaced with comprehensions for clarity and conciseness. This applies to dict comprehensions, list comprehensions, and set comprehensions.\n',
  should_flag: true,
}
