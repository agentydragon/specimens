{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/llm/sysrw/extract_dataset_crush.py',
        ],
      ],
      files: {
        'adgn/src/adgn/llm/sysrw/extract_dataset_crush.py': [
          {
            end_line: 64,
            start_line: 63,
          },
        ],
      },
      note: 'dt variable used once immediately after assignment',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/cmd_build_bundle.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/cmd_build_bundle.py': [
          {
            end_line: 190,
            start_line: 188,
          },
        ],
      },
      note: 'author, committer, message variables used once each immediately after assignment',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: 133,
            start_line: 132,
          },
          {
            end_line: 140,
            start_line: 139,
          },
          {
            end_line: null,
            start_line: 412,
          },
          {
            end_line: null,
            start_line: 427,
          },
          {
            end_line: null,
            start_line: 623,
          },
        ],
      },
      note: 'Functions _make_error_result and _abort_result - _make_error_result called only from _abort_result, and _abort_result called only 3 times without any reason argument, making the abstraction unnecessary',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/db_event_handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/db_event_handler.py': [
          {
            end_line: null,
            start_line: 52,
          },
          {
            end_line: null,
            start_line: 59,
          },
        ],
      },
      note: 'Variable event_type extracted then immediately used once on line 59',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/db_event_handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/db_event_handler.py': [
          {
            end_line: null,
            start_line: 56,
          },
          {
            end_line: null,
            start_line: 63,
          },
        ],
      },
      note: 'Variable event created then immediately used once on line 63',
      occurrence_id: 'occ-4',
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
            end_line: null,
            start_line: 59,
          },
          {
            end_line: null,
            start_line: 60,
          },
        ],
      },
      note: 'Variable bus extracted then immediately used once on line 60',
      occurrence_id: 'occ-5',
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
            end_line: null,
            start_line: 82,
          },
          {
            end_line: null,
            start_line: 83,
          },
        ],
      },
      note: 'Variable tasks created then immediately used once on line 83',
      occurrence_id: 'occ-6',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/prompt_optimizer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/prompt_optimizer.py': [
          {
            end_line: 296,
            start_line: 294,
          },
        ],
      },
      note: 'return statement could move into lines 294-296',
      occurrence_id: 'occ-7',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/grader.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/grader.py': [
          {
            end_line: 104,
            start_line: 104,
          },
        ],
      },
      note: 'tp_files variable',
      occurrence_id: 'occ-8',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/grader.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/grader.py': [
          {
            end_line: 107,
            start_line: 107,
          },
        ],
      },
      note: 'critique_files variable',
      occurrence_id: 'occ-9',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/grader.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/grader.py': [
          {
            end_line: 201,
            start_line: 201,
          },
        ],
      },
      note: 'db_run variable in session.add',
      occurrence_id: 'occ-10',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/grader.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/grader.py': [
          {
            end_line: 226,
            start_line: 226,
          },
        ],
      },
      note: 'submit_tool_name variable',
      occurrence_id: 'occ-11',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/grader.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/grader.py': [
          {
            end_line: 224,
            start_line: 224,
          },
        ],
      },
      note: 'inputs variable passed to one function call',
      occurrence_id: 'occ-12',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/grader.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/grader.py': [
          {
            end_line: 235,
            start_line: 229,
          },
        ],
      },
      note: 'prompt variable passed to one function call',
      occurrence_id: 'occ-13',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/grader.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/grader.py': [
          {
            end_line: 257,
            start_line: 249,
          },
        ],
      },
      note: 'handlers variable',
      occurrence_id: 'occ-14',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/resources.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/resources.py': [
          {
            end_line: 57,
            start_line: 55,
          },
        ],
      },
      note: 'Variables rr and s assigned once and immediately used (lines 55-57)',
      occurrence_id: 'occ-15',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/compositor/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/compositor/server.py': [
          {
            end_line: 174,
            start_line: 173,
          },
        ],
      },
      note: 'Variable client_factory assigned at line 173 and used only at line 174',
      occurrence_id: 'occ-16',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cluster_unknowns.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cluster_unknowns.py': [
          {
            end_line: 147,
            start_line: 146,
          },
        ],
      },
      note: 'Variable timestamp assigned at line 146 and used only once at line 147',
      occurrence_id: 'occ-17',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cluster_unknowns.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cluster_unknowns.py': [
          {
            end_line: 155,
            start_line: 151,
          },
        ],
      },
      note: 'Loop with intermediate variables out_spec and tasks should be inlined with asyncio.gather generator expression',
      occurrence_id: 'occ-18',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/openai_utils/model.py',
        ],
      ],
      files: {
        'adgn/src/adgn/openai_utils/model.py': [
          {
            end_line: 291,
            start_line: 283,
          },
        ],
      },
      note: 'Imperative loop with intermediate variable part should be list comprehension',
      occurrence_id: 'occ-19',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/openai_utils/model.py',
        ],
      ],
      files: {
        'adgn/src/adgn/openai_utils/model.py': [
          {
            end_line: 318,
            start_line: 315,
          },
        ],
      },
      note: 'Intermediate variable summary_items should be inlined into function call',
      occurrence_id: 'occ-20',
    },
  ],
  rationale: 'Variables and helper functions used only once should be inlined at their call site to reduce unnecessary indirection. This applies to both simple variables assigned and immediately used, and to trivial helper functions that wrap a single operation without adding semantic value.\n',
  should_flag: true,
}
