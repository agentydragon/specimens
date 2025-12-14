{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/compositor/setup.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/compositor/setup.py': [
          {
            end_line: null,
            start_line: 31,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 31 creates unnecessary res_server intermediate variable.\n\nThe variable is assigned and immediately passed to mount_inproc on the next line.\nInline the make_resources_server() call directly into the mount_inproc() call.\n',
  should_flag: true,
}
