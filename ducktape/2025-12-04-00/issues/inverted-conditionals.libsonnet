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
            end_line: 190,
            start_line: 169,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Conditional at lines 169-190 nests the complex branch inside an if, making the code harder to follow.\nThe mount.proxy is None case (line 190) is simple and should be handled with early bailout:\n- Check if mount.proxy is None, set InitializingServerEntry, continue to next mount\n- Remove the else branch and un-indent the complex logic\nThis reduces nesting depth by one level for the main logic path.\n',
  should_flag: true,
}
