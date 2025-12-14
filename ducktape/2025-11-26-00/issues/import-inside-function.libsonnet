{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/presets.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/presets.py': [
          {
            end_line: null,
            start_line: 70,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 70 has `import os` inside the `find_presets()` function. Python imports\nshould be at module top, not inside functions.\n\n**Fix:** Move `import os` to line 3 (after `from __future__ import annotations`).\n',
  should_flag: true,
}
