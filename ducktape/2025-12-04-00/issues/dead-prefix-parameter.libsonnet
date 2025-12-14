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
            end_line: 251,
            start_line: 251,
          },
          {
            end_line: 255,
            start_line: 255,
          },
          {
            end_line: 277,
            start_line: 277,
          },
        ],
      },
      note: 'mount_server: prefix parameter and computation are dead code',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/compositor/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/compositor/server.py': [
          {
            end_line: 280,
            start_line: 280,
          },
          {
            end_line: 284,
            start_line: 284,
          },
          {
            end_line: 302,
            start_line: 302,
          },
        ],
      },
      note: 'mount_inproc: prefix parameter and computation are dead code',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'The `prefix` parameter in both `mount_server()` and `mount_inproc()` is completely dead code with multiple issues:\n\n**Issue 1: Never passed as non-None**\nA ripgrep search shows all call sites use only two arguments (name and spec/server). No call site ever passes a custom prefix value. The parameter defaults to `None` in all actual usage.\n\n**Issue 2: Computed value is ignored**\nBoth methods compute `prefix = prefix or name` (lines 255 and 284), normalizing the parameter to equal `name`. However, this computed `prefix` variable is then completely ignored! The actual `self.mount()` calls at lines 277 and 302 use `prefix=name` directly, not the computed `prefix` variable.\n\n**In mount_server (lines 251-278)**:\n- Line 251: `prefix: str | None = None` parameter defined\n- Line 255: `prefix = prefix or name` - computes prefix\n- Line 277: `self.mount(proxy, prefix=name)` - **IGNORES computed prefix, uses name directly**\n\n**In mount_inproc (lines 280-309)**:\n- Line 280: `prefix: str | None = None` parameter defined\n- Line 284: `prefix = prefix or name` - computes prefix\n- Line 302: `self.mount(proxy, prefix=name)` - **IGNORES computed prefix, uses name directly**\n\n**The fix**: Remove the `prefix` parameter entirely from both methods and delete lines 255 and 284. The behavior will be identical since prefix always equals name anyway and the computed value is unused.\n',
  should_flag: true,
}
