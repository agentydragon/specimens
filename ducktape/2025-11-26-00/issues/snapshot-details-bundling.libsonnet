{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 232,
            start_line: 230,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 230-232 in runtime.py only include `details` if ALL three components\n(run_state, sampling, approval_policy) are present. If any one is missing,\nthe entire details object is omitted.\n\n**Why this is suspicious:**\n- Each component (run_state, sampling, approval_policy) has independent value\n- Why should missing `sampling` prevent including `run_state` and `approval_policy`?\n- This creates artificial coupling between unrelated data\n- Consumers likely want partial data rather than all-or-nothing\n\n**Likely correct solution:**\nInclude components individually in the Snapshot as optional fields, rather than\nbundling them in a monolithic SnapshotDetails object:\n```\nreturn Snapshot(\n    ...,\n    run_state=self.active_run,      # Optional\n    sampling=sampling,               # Optional\n    approval_policy=approval_policy, # Optional\n)\n```\n\nThis eliminates artificial coupling and allows clients to handle partial data\ngracefully. Each field has independent optionality rather than forced all-or-nothing.\n\n**Alternative:** If you must keep the bundle, make SnapshotDetails fields optional\nso the object can be constructed with partial data.\n',
  should_flag: true,
}
