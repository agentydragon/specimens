{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/compositor/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/compositor/server.py': [
          {
            end_line: 279,
            start_line: 251,
          },
          {
            end_line: 309,
            start_line: 280,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Massive duplication between `mount_server()` (lines 251-279) and `mount_inproc()` (lines 280-309) in compositor/server.py. The two methods are almost identical, differing only in:\n\n1. The setup call: `await mount.setup_external(spec, ...)` vs `await mount.setup_inproc(server, ...)`\n2. The spec stored: `Mount(name=name, pinned=pinned, spec=spec)` vs `Mount(name=name, pinned=pinned, spec=None)`\n\nThe duplicate code includes (~50 lines each):\n- State checking (CLOSED validation)\n- Name validation (regex pattern matching)\n- Prefix normalization (`prefix = prefix or name`)\n- Duplicate check under lock\n- Mount registration under lock\n- Proxy mounting on FastMCP surface\n- Mount listener notifications (identical STATE and MOUNTED events)\n- Exception-safety patterns\n\n**Additional finding**: The `prefix` parameter is never passed as non-None in any call site (ripgrep shows all calls use two arguments only). Lines 278 and 329 both do `prefix = prefix or name`, making the parameter effectively dead - it always equals `name`. This should be removed entirely.\n\n**Suggested refactoring**: Extract a shared `_mount_common()` helper that accepts a setup function/lambda, taking the Mount instance and performing setup. Both public methods would call this helper:\n- `mount_server` passes `lambda m: m.setup_external(spec, ...)`\n- `mount_inproc` passes `lambda m: m.setup_inproc(server, ...)`\n\nThis would eliminate ~40 lines of duplication and improve maintainability.\n',
  should_flag: true,
}
