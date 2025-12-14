{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/cli.py': [
          {
            end_line: 10,
            start_line: 10,
          },
          {
            end_line: 65,
            start_line: 64,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The top-level CLI help text (lines 6-10) shows a usage example with `--port 8080`, but the\nactual serve command defines `--mcp-port` (line 64) and `--ui-port` (line 65) options instead.\nThere is no `--port` option, so following the documented example causes an "no such option"\nerror. The help text and actual CLI arguments are inconsistent.\n',
  should_flag: true,
}
