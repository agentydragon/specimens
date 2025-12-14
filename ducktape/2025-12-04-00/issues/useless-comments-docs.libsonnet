{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/protocol.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/protocol.py': [
          {
            end_line: null,
            start_line: 78,
          },
        ],
      },
      note: 'Comment restates import statement visible two lines above',
      occurrence_id: 'occ-0',
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
            start_line: 99,
          },
        ],
      },
      note: 'Comment restates type annotation already present on line above',
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
            end_line: null,
            start_line: 96,
          },
        ],
      },
      note: 'Vague comment about middleware behavior without adding useful detail',
      occurrence_id: 'occ-2',
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
            start_line: 124,
          },
        ],
      },
      note: 'Comment "Agent identifier for persistence" restates what field name already communicates',
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
            start_line: 54,
          },
        ],
      },
      note: 'Comment restates what Event model field documentation should cover',
      occurrence_id: 'occ-4',
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
            start_line: 61,
          },
        ],
      },
      note: 'Comment about ORM serialization is redundant with field type',
      occurrence_id: 'occ-5',
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
            start_line: 51,
          },
        ],
      },
      note: 'Comment about field name extraction is obvious from code',
      occurrence_id: 'occ-6',
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
            end_line: 49,
            start_line: 47,
          },
        ],
      },
      note: 'Docstring duplicates information in Args section below',
      occurrence_id: 'occ-7',
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
            end_line: 5,
            start_line: 1,
          },
        ],
      },
      note: 'Module docstring duplicates class docstring verbatim',
      occurrence_id: 'occ-8',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/handler.py': [
          {
            end_line: null,
            start_line: 4,
          },
        ],
      },
      note: 'Comment stating obvious fact about imports being single source of truth',
      occurrence_id: 'occ-9',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/transcript_handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/transcript_handler.py': [
          {
            end_line: null,
            start_line: 64,
          },
        ],
      },
      note: 'Comment "Record adapter ReasoningItem via shared JSONL mapping" adds no information beyond method name',
      occurrence_id: 'occ-10',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/stubs/typed_stubs.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/stubs/typed_stubs.py': [
          {
            end_line: null,
            start_line: 17,
          },
        ],
      },
      note: 'Comment "We use the concrete FastMCP Client type" restates what type annotation already shows',
      occurrence_id: 'occ-11',
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
            end_line: null,
            start_line: 290,
          },
        ],
      },
      note: 'Comment "Prepare a uniquely named notebook document id/path" restates what function name _ensure_document_id already communicates',
      occurrence_id: 'occ-12',
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
            end_line: null,
            start_line: 156,
          },
        ],
      },
      note: 'Comment about non-existent child_* helpers',
      occurrence_id: 'occ-13',
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
            end_line: 229,
            start_line: 227,
          },
        ],
      },
      note: 'Comment about non-existent resource helper methods',
      occurrence_id: 'occ-14',
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
            end_line: null,
            start_line: 328,
          },
        ],
      },
      note: 'Historical comment about removed Python-only mount listing',
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
            end_line: null,
            start_line: 331,
          },
        ],
      },
      note: 'Comment stating obvious default (inherit FastMCP protocol handlers)',
      occurrence_id: 'occ-16',
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
            end_line: null,
            start_line: 333,
          },
        ],
      },
      note: 'Comment stating obvious default (resource operations not overridden)',
      occurrence_id: 'occ-17',
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
            end_line: null,
            start_line: 341,
          },
        ],
      },
      note: 'Comment about non-existent manual slot construction',
      occurrence_id: 'occ-18',
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
            end_line: null,
            start_line: 354,
          },
        ],
      },
      note: 'Comment about non-existent URI decoding helpers',
      occurrence_id: 'occ-19',
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
            end_line: null,
            start_line: 188,
          },
        ],
      },
      note: 'Comment "Generate unique IDs for this run" states the obvious (uuid4() calls)',
      occurrence_id: 'occ-20',
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
            end_line: null,
            start_line: 192,
          },
        ],
      },
      note: 'Comment uses "Phase 1" language unnecessarily formal for simple DB write',
      occurrence_id: 'occ-21',
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
            end_line: null,
            start_line: 209,
          },
        ],
      },
      note: 'Comment "Fetch critique from database" restates what _get_required_critique function name already communicates',
      occurrence_id: 'occ-22',
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
            end_line: null,
            start_line: 222,
          },
        ],
      },
      note: 'Comment "Build grader inputs and state" restates obvious object construction',
      occurrence_id: 'occ-23',
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
            end_line: null,
            start_line: 280,
          },
        ],
      },
      note: 'Comment uses "Phase 2" language unnecessarily formal for simple DB update',
      occurrence_id: 'occ-24',
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
            end_line: null,
            start_line: 306,
          },
        ],
      },
      note: 'Comment "Fetch snapshot_slug from critique" restates obvious field access',
      occurrence_id: 'occ-25',
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
            end_line: null,
            start_line: 309,
          },
        ],
      },
      note: 'Comment "Create grader input" restates obvious GraderInput construction',
      occurrence_id: 'occ-26',
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
            end_line: null,
            start_line: 312,
          },
        ],
      },
      note: 'Comment "Load and hydrate specimen once, then execute" restates what the async with block obviously does',
      occurrence_id: 'occ-27',
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
            end_line: null,
            start_line: 314,
          },
        ],
      },
      note: 'Comment "Execute grader run" restates what run_grader function call obviously does',
      occurrence_id: 'occ-28',
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
            end_line: null,
            start_line: 145,
          },
        ],
      },
      note: 'Comment "Inline cluster_output_dir (only called here)" describes what was already done, obvious from code',
      occurrence_id: 'occ-29',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/docker_env.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/docker_env.py': [
          {
            end_line: null,
            start_line: 21,
          },
        ],
      },
      note: 'Comment "Shared startup command for long-lived containers" is misplaced, no startup command follows',
      occurrence_id: 'occ-30',
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
            end_line: null,
            start_line: 182,
          },
        ],
      },
      note: 'Comment "Map container path to host path" restates obvious transformation',
      occurrence_id: 'occ-31',
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
            end_line: 199,
            start_line: 195,
          },
        ],
      },
      note: 'Comments "Read prompt text from host filesystem" and "Hash and upsert to database" restate self-documenting function names',
      occurrence_id: 'occ-32',
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
            end_line: null,
            start_line: 223,
          },
        ],
      },
      note: 'Comment "Check snapshot split and enforce validation restriction" restates what the code block does',
      occurrence_id: 'occ-33',
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
            end_line: null,
            start_line: 358,
          },
        ],
      },
      note: 'Comment "Build extra volumes for Docker" restates obvious dict construction',
      occurrence_id: 'occ-34',
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
            end_line: null,
            start_line: 119,
          },
        ],
      },
      note: 'Comment "API requires this field" states an obvious requirement',
      occurrence_id: 'occ-35',
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
            end_line: null,
            start_line: 134,
          },
        ],
      },
      note: 'Comment "Responses API prefers the payload under output" states obvious field naming',
      occurrence_id: 'occ-36',
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
            end_line: null,
            start_line: 297,
          },
        ],
      },
      note: 'Comment "Removed legacy aliases..." documents historical change rather than current behavior',
      occurrence_id: 'occ-37',
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
            end_line: null,
            start_line: 323,
          },
        ],
      },
      note: 'Comment "Already string from SDK" states obvious type from context',
      occurrence_id: 'occ-38',
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
            end_line: null,
            start_line: 363,
          },
        ],
      },
      note: 'Comment "No baked-in defaults..." states what code does not do rather than explaining behavior',
      occurrence_id: 'occ-39',
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
            end_line: 372,
            start_line: 370,
          },
        ],
      },
      note: 'Section header "Test-friendly fake..." does not describe the class below it (BoundOpenAIModel is not a test fake)',
      occurrence_id: 'occ-40',
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
            end_line: null,
            start_line: 114,
          },
        ],
      },
      note: 'Docstring line "Gets converted to SDK format when sending to API" states universal behavior that applies to all items',
      occurrence_id: 'occ-41',
    },
  ],
  rationale: 'Useless comments and docstrings that restate what the code obviously does, duplicate information already present in docstrings/types, refer to non-existent code, or state universal behavior that applies to all items in a module. These add no value and clutter the code.\n',
  should_flag: true,
}
