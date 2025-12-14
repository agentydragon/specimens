{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 153,
            start_line: 150,
          },
          {
            end_line: 180,
            start_line: 172,
          },
          {
            end_line: 186,
            start_line: 183,
          },
        ],
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: 217,
            start_line: 198,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 153 initializes `_policy_id: int = 1`. Line 175 in `set_policy()` just increments\n`self._policy_id += 1` without calling persistence, creating an invented in-memory counter\nthat diverges from actual database IDs.\n\nThe persistence layer (sqlite.py:198-217) marks existing ACTIVE policy as SUPERSEDED, creates\nnew ACTIVE policy, and returns the database-assigned ID. But `set_policy()` never calls it,\nso `_policy_id` becomes an arbitrary counter unrelated to actual persisted policy IDs.\n\nScenario: Load policy ID 5 from database via `load_policy()`, then call `set_policy()` twice.\nResult: `_policy_id` becomes 7 (5+1+1), but database has actual IDs 6 and 7. Logs/traces/MCP\nresources show mismatched IDs, breaking data integrity.\n\nMake `set_policy` async, call `await self.persistence.set_policy(...)`, and store the returned\nactual database ID in `_policy_id`. This ensures consistency: every component uses the same ID\nfor the same policy.\n',
  should_flag: true,
}
