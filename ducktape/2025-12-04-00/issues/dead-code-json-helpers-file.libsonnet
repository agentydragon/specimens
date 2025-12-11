local I = import '../../lib.libsonnet';

I.issue(
  rationale=|||
    The entire `json_helpers.py` file (68 lines) is dead code. All 4 functions are defined but never called anywhere in the codebase:
    - `read_line_json_dict_async` (async read JSON from stream)
    - `read_line_json_dict` (sync read JSON from stream)
    - `send_line_json_async` (async send JSON to stream)
    - `send_line_json` (sync send JSON to stream)

    These line-delimited JSON helpers are not used by any MCP code. The file should be deleted entirely.
  |||,
  filesToRanges={
    'adgn/src/adgn/mcp/_shared/json_helpers.py': null,
  }
)
