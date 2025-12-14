{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/builder.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/builder.py': [
          {
            end_line: 72,
            start_line: 70,
          },
          {
            end_line: 86,
            start_line: 84,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 70-72 and 84-86 split with_ui conditional logic unnecessarily. First\nblock creates ui_bus and connection_manager, then builder.start() executes,\nthen second block attaches UI sidecar. These operations are independent and\ncould be consolidated.\n\n**Problem:** Split conditional increases cognitive load and makes control flow\nharder to follow. The two if with_ui blocks could be merged, or consolidated\nentirely by moving ConnectionManager construction inline and creating ui_bus\nonly when needed.\n\n**Fix:** Consolidate into single block after builder.start() by using inline\nconditional for connection_manager and creating ui_bus only in the final if\nblock. Eliminates split conditional.\n',
  should_flag: true,
}
