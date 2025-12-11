local I = import '../../lib.libsonnet';

I.issueMulti(
  rationale=|||
    The helper function `_parse_json_or_none` is duplicated identically in two files. Both implementations are exactly the same 7-line function that parses JSON from an optional string, returning None on empty input or parse errors.

    This should be extracted to a shared utility module (e.g., `adgn/src/adgn/agent/json_utils.py`) and imported in both places. The duplication violates DRY and makes future fixes require touching multiple files.
  |||,
  occurrences=[
    {
      files: {
        'adgn/src/adgn/agent/event_renderer.py': [[156, 163]],
      },
      note: 'First copy of _parse_json_or_none in event_renderer.py',
      expect_caught_from: [['adgn/src/adgn/agent/event_renderer.py']],
    },
    {
      files: {
        'adgn/src/adgn/agent/rich_display.py': [[300, 307]],
      },
      note: 'Second copy of _parse_json_or_none in rich_display.py',
      expect_caught_from: [['adgn/src/adgn/agent/rich_display.py']],
    },
  ]
)
