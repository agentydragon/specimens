{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: 178,
            start_line: 153,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "list_agents_last_activity uses MAX(COALESCE(e.event_at, r.finished_at, r.started_at, a.created_at))\nbut COALESCE is evaluated per joined row, not across all rows. When a run has any events,\nCOALESCE always picks e.event_at for those rows, so r.finished_at and r.started_at are never\nconsidered even if they're later than the last event. This contradicts the docstring which\npromises to take the maximum across all timestamp sources.\n\nThe query should compute the maximum of each timestamp column separately, then take the max\nof those maxes. One approach: use UNION ALL to gather all timestamps into a single column,\nthen MAX per agent. Example:\n\nWITH activity AS (\n  SELECT r.agent_id, e.event_at as ts FROM events e JOIN runs r ON e.run_id = r.id\n  UNION ALL\n  SELECT agent_id, finished_at as ts FROM runs WHERE finished_at IS NOT NULL\n  UNION ALL\n  SELECT agent_id, started_at as ts FROM runs WHERE started_at IS NOT NULL\n  UNION ALL\n  SELECT id as agent_id, created_at as ts FROM agents\n)\nSELECT agent_id, MAX(ts) as last_ts FROM activity GROUP BY agent_id\n",
  should_flag: true,
}
