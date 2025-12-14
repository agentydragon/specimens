{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/resources/server.py',
        ],
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
        'adgn/src/adgn/mcp/resources/server.py': [
          {
            end_line: 360,
            start_line: 355,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Multiple locations (server.py:355-360, buffer.py:105-115) loop through mount names to\ntranslate a resource URI back to its origin server name. This pattern is duplicated.\n\n**The pattern:** Loop through mount_names, check `has_resource_prefix(uri, mn, format)`,\nreturn first match. But error handling differs: some return None, some \"unknown\", some\nraise exceptions.\n\n**Problems:** Code duplication, inconsistent error handling, not DRY. This logic might\nalready exist in FastMCP's proxy mounting implementation.\n\n**Fix:** Create `derive_origin_server(uri, mount_names, prefix_format, raise_on_unknown=True)`\nhelper in `compositor/helpers.py`. Returns first matching server name, raises ValueError\nwith available servers if no match (when raise_on_unknown=True), or returns None otherwise.\nReplace all manual loops with calls to this function for centralized logic and consistent\nerror handling.\n",
  should_flag: true,
}
