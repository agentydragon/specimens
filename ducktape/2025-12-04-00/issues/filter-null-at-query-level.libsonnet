{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cluster_unknowns.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cluster_unknowns.py': [
          {
            end_line: 138,
            start_line: 132,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 132-138 in cluster_unknowns.py load ALL GraderRun and Critique records from the database, then filter out NULL outputs in Python code later (inside _extract_unknowns_from_run at lines 62-63).\n\nThis is inefficient because we're loading potentially many rows with NULL outputs from the database, only to discard them immediately. The filtering should happen at the SQL query level using WHERE clauses, similar to how other CLI commands (e.g., the stats subcommand) filter NULL outputs in their queries.\n\nThe query (line 136) should add filters for:\n- `GraderRun.output.is_not(None)`\n- `Critique.payload.is_not(None)` (if applicable)\n\nThis avoids loading and processing rows that will be discarded, improving performance especially with large datasets.\n",
  should_flag: true,
}
