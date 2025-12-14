{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/notifying_fastmcp.py',
          'adgn/src/adgn/mcp/_shared/fastmcp_flat.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/fastmcp_flat.py': [
          {
            end_line: 10,
            start_line: 1,
          },
        ],
        'adgn/src/adgn/mcp/notifying_fastmcp.py': [
          {
            end_line: 10,
            start_line: 1,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'FastMCP enhancement modules are inconsistently placed: `notifying_fastmcp.py` lives at the top level of `src/adgn/mcp/`, while `fastmcp_flat.py` lives under `src/adgn/mcp/_shared/`.\n\nThis creates confusion about where FastMCP enhancements should be located. The `_shared/` directory is unclear in purpose and splits related functionality. Developers must search multiple locations to understand the full set of FastMCP enhancements available.\n\nAll FastMCP enhancements should be co-located in a single namespace (e.g., `src/adgn/mcp/enhanced/`) for clarity and discoverability.\n',
  should_flag: true,
}
