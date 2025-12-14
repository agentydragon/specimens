{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/event_renderer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/event_renderer.py': [
          {
            end_line: 163,
            start_line: 156,
          },
        ],
      },
      note: 'First copy of _parse_json_or_none in event_renderer.py',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/rich_display.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/rich_display.py': [
          {
            end_line: 307,
            start_line: 300,
          },
        ],
      },
      note: 'Second copy of _parse_json_or_none in rich_display.py',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'The helper function `_parse_json_or_none` is duplicated identically in two files. Both implementations are exactly the same 7-line function that parses JSON from an optional string, returning None on empty input or parse errors.\n\nThis should be extracted to a shared utility module (e.g., `adgn/src/adgn/agent/json_utils.py`) and imported in both places. The duplication violates DRY and makes future fixes require touching multiple files.\n',
  should_flag: true,
}
