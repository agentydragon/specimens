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
            end_line: 312,
            start_line: 311,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 311-312 silently succeed when given an empty server name: \"if name in ('',): return\". This is wrong because if validation fails and an empty string reaches this point, the caller receives None (appearing like success) instead of a clear error.\n\nIf the upstream validation at line 253 is reliable, this check is redundant and should be removed. If this is meant as a defensive check against validation failures, it should raise ValueError(\"server name cannot be empty\") rather than silently returning. Silent success on invalid input masks bugs and makes debugging harder.\n",
  should_flag: true,
}
