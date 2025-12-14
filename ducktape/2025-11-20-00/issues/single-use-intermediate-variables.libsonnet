{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/local_runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/local_runtime.py': [
          {
            end_line: null,
            start_line: 123,
          },
          {
            end_line: null,
            start_line: 144,
          },
        ],
      },
      note: 'all_handlers variable created from list(handlers) + self._extra_handlers, used once in MiniCodex.create call',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/mcp_routing.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/mcp_routing.py': [
          {
            end_line: 144,
            start_line: 141,
          },
        ],
      },
      note: 'body and response_headers variables both created and used once in Response constructor',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 128,
            start_line: 120,
          },
          {
            end_line: 196,
            start_line: 188,
          },
        ],
      },
      note: 'envelope and dumped variables: create Envelope, serialize with model_dump, pass to put_nowait/send_json',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/reducer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/reducer.py': [
          {
            end_line: 61,
            start_line: 60,
          },
        ],
      },
      note: 'md variable extracts evt.message.content, used once in AssistantMarkdownItem constructor',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/sidecars.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/sidecars.py': [
          {
            end_line: 36,
            start_line: 35,
          },
          {
            end_line: 59,
            start_line: 58,
          },
        ],
      },
      note: 'ui_server and loop_server variables: factory results used once in mount_inproc',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/handler.py': [
          {
            end_line: 136,
            start_line: 133,
          },
        ],
      },
      note: 'result_model variable: result of convert_fastmcp_result used once in FunctionCallOutputPayload',
      occurrence_id: 'occ-5',
    },
  ],
  rationale: 'Variables assigned once and used immediately afterward add no semantic value\nand should be inlined at their use sites.\n\nBenefits of inlining:\n- Reduces line count and removes unnecessary names\n- Makes data flow clearer (transformation visible at use site)\n- Eliminates cognitive overhead of tracking intermediate variables\n- Standard pattern for single-use values\n\nNote: Variables used multiple times should NOT be inlined to avoid\nduplication or re-evaluation.\n',
  should_flag: true,
}
