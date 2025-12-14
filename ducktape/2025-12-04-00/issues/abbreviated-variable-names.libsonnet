{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: null,
            start_line: 358,
          },
          {
            end_line: null,
            start_line: 360,
          },
          {
            end_line: null,
            start_line: 396,
          },
          {
            end_line: null,
            start_line: 407,
          },
          {
            end_line: null,
            start_line: 411,
          },
          {
            end_line: 563,
            start_line: 555,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Variables abbreviated to save characters without achieving any meaningful line length savings. Full descriptive names improve readability at negligible cost.\n\nSpecific instances:\n- cid → call_id (used throughout agent.py)\n- ocid → original_call_id (lines 555-563)\n\nThe abbreviations save 5-6 characters but don't prevent any line wrapping, so they only reduce clarity.\n",
  should_flag: true,
}
