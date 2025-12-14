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
            end_line: 32,
            start_line: 32,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 32 of compositor/setup.py hardcodes the string literal "resources" twice instead of using the existing shared constant `RESOURCES_SERVER_NAME` from `adgn.mcp._shared.constants`.\n\nThe constant is already imported and used elsewhere in the codebase (e.g., line 44 in constants.py defines `RESOURCES_SERVER_NAME: Final[str] = "resources"`), and other server names in the same function use their respective constants (e.g., `COMPOSITOR_META_SERVER_NAME`, `COMPOSITOR_ADMIN_SERVER_NAME`).\n\nUsing string literals creates maintenance burden - if the server name ever changes, it needs to be updated in multiple places. The constant should be imported and used instead.\n',
  should_flag: true,
}
