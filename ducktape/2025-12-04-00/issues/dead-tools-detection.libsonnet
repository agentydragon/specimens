{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/shared.py',
        ],
        [
          'adgn/src/adgn/props/cli_app/main.py',
        ],
        [
          'adgn/src/adgn/props/prompts/_partials.j2',
        ],
        [
          'adgn/src/adgn/props/prompts/_base.j2.md',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/main.py': [
          {
            end_line: null,
            start_line: 448,
          },
        ],
        'adgn/src/adgn/props/cli_app/shared.py': [
          {
            end_line: 111,
            start_line: 76,
          },
        ],
        'adgn/src/adgn/props/prompts/_base.j2.md': [
          {
            end_line: null,
            start_line: 86,
          },
        ],
        'adgn/src/adgn/props/prompts/_partials.j2': [
          {
            end_line: 21,
            start_line: 8,
          },
        ],
        'adgn/src/adgn/props/prompts/util.py': [
          {
            end_line: 88,
            start_line: 86,
          },
          {
            end_line: 105,
            start_line: 105,
          },
          {
            end_line: 108,
            start_line: 108,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Tool detection machinery (`detect_tools()`, `tools_section()` macro, `available_tools` parameter) is dead code because `include_tools` is hardcoded to `False` in `build_standard_context()`.\n\nThe flow:\n1. `cli/main.py` calls `detect_tools()` to check which analysis tools (ruff, mypy, vulture, etc.) are available on PATH\n2. Result passed to `build_standard_context(available_tools=...)`\n3. Context sets `include_tools: False` (line 108)\n4. Jinja template checks `{% if include_tools %}` before rendering `tools_section(available_tools)`\n5. Condition is never true, so tool list never appears in prompts\n\nThe `detect_tools()` function checks 21 tools (ruff, mypy, pyright, vulture, bandit, etc.) but this work is wasted since the output is never used.\n\n**Possible resolutions:**\n\n1. **Remove dead code** (simplest):\n   - Delete `detect_tools()` from `cli/shared.py`\n   - Remove `available_tools` parameter from `build_standard_context()`\n   - Remove `tools_section()` macro from `prompts/_partials.j2`\n   - Remove `{% if include_tools %}` conditional from `prompts/_base.j2.md`\n\n2. **Enable the feature**:\n   - Set `include_tools=True` in appropriate contexts (e.g., when running `check` or `fix` commands)\n   - Would tell LLM which tools it can use for analysis\n   - Consider making it configurable per-command rather than always False\n\n3. **Autonomous tool detection**:\n   - Remove host-side detection entirely\n   - Provide LLM with reference list of ~100 common tools\n   - Let LLM attempt to use tools and discover what's available\n   - More robust (works in Docker, doesn't depend on host PATH)\n   - Example prompt: \"Common analysis tools: ruff, mypy, vulture, bandit... Try running tools to see what's available\"\n\nNote: Host-side detection (`shutil.which()`) is problematic because the critic runs in Docker, so host PATH is irrelevant. Option 3 (autonomous detection) better matches the actual execution environment.\n",
  should_flag: true,
}
