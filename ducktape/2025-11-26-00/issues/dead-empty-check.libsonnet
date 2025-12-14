{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/reducer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/reducer.py': [
          {
            end_line: 186,
            start_line: 185,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 185-186 check `if not batch.resources: return None`. This is dead code\nbecause `batch.resources` is a dict, and the next check (lines 189-193) already\nfilters for servers with actual updates, returning None if the filtered dict is\nempty.\n\nThe behavior is identical whether `batch.resources` is an empty dict or just\ndoesn't have any entries with updates. The early return for empty dict adds no value.\n\n**Fix:** Delete lines 185-186. The filtering logic already handles the \"no updates\" case.\n",
  should_flag: true,
}
