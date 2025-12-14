{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/models.py': [
          {
            end_line: null,
            start_line: 149,
          },
        ],
      },
      note: 'Database model uses int for proposal_id',
      occurrence_id: 'occ-0',
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
            start_line: 223,
          },
          {
            end_line: null,
            start_line: 259,
          },
          {
            end_line: 289,
            start_line: 280,
          },
          {
            end_line: 321,
            start_line: 311,
          },
        ],
      },
      note: 'SQLite layer converts str to int with try/except',
      occurrence_id: 'occ-1',
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
            start_line: 202,
          },
          {
            end_line: null,
            start_line: 204,
          },
          {
            end_line: null,
            start_line: 205,
          },
          {
            end_line: null,
            start_line: 206,
          },
        ],
      },
      note: 'Protocol interface uses str return/param types',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: null,
            start_line: 211,
          },
          {
            end_line: null,
            start_line: 237,
          },
          {
            end_line: null,
            start_line: 254,
          },
        ],
      },
      note: 'Approvals module uses str proposal_id',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: null,
            start_line: 747,
          },
        ],
      },
      note: 'MCP tool uses str proposal_id',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/resources.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/resources.py': [
          {
            end_line: null,
            start_line: 67,
          },
        ],
      },
      note: 'Resources module uses str proposal_id',
      occurrence_id: 'occ-5',
    },
  ],
  rationale: "Policy proposal_id (models.py:149) database column is int, but all APIs\naccept str and convert with try/except int() at runtime. 13 locations have\nidentical conversion logic.\n\nUsing domain types provides:\n- Type safety: can't mix different ID types\n- Semantic clarity: not just any string/int, but specific identifier\n- No runtime conversions/validation\n- Clear type contracts in signatures\n",
  should_flag: true,
}
