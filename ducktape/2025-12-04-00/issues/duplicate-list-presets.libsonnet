{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/main.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/main.py': [
          {
            end_line: null,
            start_line: 573,
          },
          {
            end_line: null,
            start_line: 592,
          },
          {
            end_line: null,
            start_line: 605,
          },
          {
            end_line: 616,
            start_line: 614,
          },
          {
            end_line: 683,
            start_line: 680,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `list-presets` functionality is duplicated: both a `--list-presets` boolean flag on `cmd_run` and a separate `list-presets` command exist.\n\nBoth implementations call the same `_print_presets()` helper and provide identical functionality:\n- Line 605: `list_presets: bool = typer.Option(False, \"--list-presets\", ...)`\n- Line 614-616: `if list_presets: _print_presets(); return`\n- Line 680-683: `@app.command(\"list-presets\")` that calls `_print_presets()`\n\n**Why this is problematic:**\n\n1. **Inconsistent UX**: Two ways to do the same thing confuses users\n2. **Maintenance burden**: Changes to listing logic need updates in two places\n3. **Error message inconsistency**: Line 573 says \"Use --list-presets\" but `adgn-properties list-presets` also works\n4. **Flag pollution**: The `run` command has many parameters; info-only flags clutter the interface\n\n**Recommended fix:**\n\nRemove the `--list-presets` flag from `cmd_run` and keep only the dedicated `list-presets` command:\n- Delete line 605 (`list_presets` parameter)\n- Delete lines 614-616 (flag handling)\n- Update line 573 error message: \"Use --list-presets\" → \"Use 'adgn-properties list-presets'\"\n- Update line 592 help text: \"see --list-presets\" → \"see 'adgn-properties list-presets'\"\n\n**Rationale for keeping command over flag:**\n\n- Dedicated commands are clearer: `list-presets` is self-documenting\n- Flags that exit early are anti-patterns (they're not really options, they're alternative operations)\n- Consistent with other info commands like `snapshot list`, `snapshot dump`\n- Separates concerns: `run` is for execution, `list-presets` is for discovery\n",
  should_flag: true,
}
