{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/notifications/buffer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/notifications/buffer.py': [
          {
            end_line: 115,
            start_line: 105,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 105-115 return fabricated string `"unknown"` when no server matches\nthe URI. This fails silently: callers might not handle it specially, it\ncould be used as an actual server name downstream, and bugs become harder\nto track (error happens far from source).\n\nFix: raise `ValueError` with clear message including the URI and available\nservers. This fails fast and loud, provides context, and forces callers\nto handle the error case properly.\n',
  should_flag: true,
}
