{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/handlers.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/handlers.py': [
          {
            end_line: 27,
            start_line: 25,
          },
        ],
      },
      note: 'build_handlers: "Returns" line restates return type',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 52,
            start_line: 50,
          },
        ],
      },
      note: 'default_client_factory: useless docstring',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/container.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/container.py': [
          {
            end_line: 129,
            start_line: 128,
          },
        ],
      },
      note: 'default_client_factory: mostly useless docstring',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Several functions have docstrings that add no information beyond what the function\nsignature already provides. These are noise.\n\n**Examples:**\n1. handlers.py:25-27 `build_handlers()`: "Returns (handlers, persist_handler)" just\n   restates the return type annotation.\n2. app.py:50-52 `default_client_factory()`: "Default LLM client factory" restates the\n   function name with no added value.\n3. container.py:128-129 `default_client_factory()`: "Default LLM client factory used\n   when no custom factory is provided" - first part redundant, second part slightly\n   useful but could be condensed.\n\n**Principle:** Docstrings should explain WHY, not WHAT. "Returns X" when signature says\n"-> X" is noise. Restating the function name in prose is useless. Type annotations\nalready document the "what".\n\n**Fix:** Delete useless docstrings entirely. Where partial value exists, condense to\nonly the non-redundant part.\n',
  should_flag: true,
}
