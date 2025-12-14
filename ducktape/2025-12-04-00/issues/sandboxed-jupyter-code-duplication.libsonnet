{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py': [
          {
            end_line: 26,
            start_line: 22,
          },
        ],
      },
      note: 'Duplicate _pick_free_port function - canonical implementation exists in adgn.util.net.pick_free_port',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/sandboxed_jupyter/wrapper.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/sandboxed_jupyter/wrapper.py': [
          {
            end_line: 196,
            start_line: 193,
          },
        ],
      },
      note: 'Duplicate _pick_free_port function - canonical implementation exists in adgn.util.net.pick_free_port',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py',
          'adgn/src/adgn/mcp/sandboxed_jupyter/wrapper.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py': [
          {
            end_line: 80,
            start_line: 29,
          },
        ],
        'adgn/src/adgn/mcp/sandboxed_jupyter/wrapper.py': [
          {
            end_line: 249,
            start_line: 199,
          },
        ],
      },
      note: 'Duplicate _start_jupyter_server implementations with nearly identical jupyter server command construction',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py',
          'adgn/src/adgn/mcp/sandboxed_jupyter/wrapper.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py': [
          {
            end_line: 161,
            start_line: 142,
          },
        ],
        'adgn/src/adgn/mcp/sandboxed_jupyter/wrapper.py': [
          {
            end_line: 93,
            start_line: 85,
          },
          {
            end_line: 324,
            start_line: 305,
          },
        ],
      },
      note: 'Duplicate jupyter-mcp-server command construction in three places (Python and bash)',
      occurrence_id: 'occ-3',
    },
  ],
  rationale: 'The sandboxed_jupyter module contains multiple instances of duplicated code that should be consolidated into shared implementations.\n',
  should_flag: true,
}
