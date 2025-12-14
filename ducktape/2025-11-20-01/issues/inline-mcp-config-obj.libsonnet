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
            end_line: 141,
            start_line: 139,
          },
          {
            end_line: 158,
            start_line: 155,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 139-140 and 155-156 extract mcp_config_obj and immediately use it once to\ncreate uvicorn.Server. This single-use intermediate variable should be inlined.\n\nPattern at both locations: create Config, assign to mcp_config_obj, pass to Server\nconstructor. Variable name adds no semantic clarity beyond the constructor call itself.\n\nInline to: uvicorn.Server(uvicorn.Config(app=mcp_app, host=host, port=mcp_port,\nlog_level="info")). Still readable because parameters are self-documenting and\nnesting is clear. Standard pattern: Config is just a parameter to Server, no need\nto name it separately unless reused.\n',
  should_flag: true,
}
