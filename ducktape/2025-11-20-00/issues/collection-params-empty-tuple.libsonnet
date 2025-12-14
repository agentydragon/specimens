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
            start_line: 73,
          },
          {
            end_line: null,
            start_line: 84,
          },
        ],
      },
      note: 'extra_handlers defaults to None, then converted with `list(extra_handlers or [])`',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/policies/scaffold.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/policies/scaffold.py': [
          {
            end_line: null,
            start_line: 11,
          },
          {
            end_line: null,
            start_line: 21,
          },
        ],
      },
      note: 'tests defaults to None, then guarded with `if tests:`',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: null,
            start_line: 99,
          },
          {
            end_line: 102,
            start_line: 101,
          },
        ],
      },
      note: 'attach/detach default to None, then reassigned with `attach or {}` and `detach if detach is not None else []`',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/__init__.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/__init__.py': [
          {
            end_line: null,
            start_line: 141,
          },
        ],
      },
      note: 'Protocol signature uses Optional instead of default empty collection',
      occurrence_id: 'occ-3',
    },
  ],
  rationale: 'Functions accept collection parameters as Optional, defaulting to None, then\ncheck for None and convert to empty collection. Should use empty collection\nas default instead.\n\nBenefits:\n- Simpler type: no Optional/union with None\n- No None checks or reassignments needed\n- Empty tuple is immutable and safe as default\n- Clearer intent: "no items" vs "missing value"\n- Empty collections are falsy if bool check needed\n\nThis is a standard Python idiom for collection parameters.\n',
  should_flag: true,
}
