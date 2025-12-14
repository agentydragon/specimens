{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/core.py',
        ],
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
        [
          'adgn/src/adgn/git_commit_ai/editor_template.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 52,
            start_line: 52,
          },
          {
            end_line: 128,
            start_line: 128,
          },
          {
            end_line: 145,
            start_line: 145,
          },
          {
            end_line: 153,
            start_line: 153,
          },
          {
            end_line: 510,
            start_line: 508,
          },
          {
            end_line: 520,
            start_line: 513,
          },
          {
            end_line: 524,
            start_line: 524,
          },
          {
            end_line: 672,
            start_line: 672,
          },
          {
            end_line: 698,
            start_line: 698,
          },
        ],
        'adgn/src/adgn/git_commit_ai/core.py': [
          {
            end_line: 63,
            start_line: 61,
          },
          {
            end_line: 170,
            start_line: 170,
          },
          {
            end_line: 190,
            start_line: 190,
          },
        ],
        'adgn/src/adgn/git_commit_ai/editor_template.py': [
          {
            end_line: 77,
            start_line: 77,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Functions manually parse `passthru: list[str]` with string checks to determine CLI flags:\n`include_all_from_passthru()` checks for `-a`/`--all` (core.py:61-63), `filter_commit_passthru()`\nremoves those flags (cli.py:508-510), `_validate_no_message_flag()` checks `-m`/`--message`\n(cli.py:513-520), and inline checks for `--amend` (cli.py:672) and `-v`/`--verbose`\n(editor_template.py:77).\n\nThis is fragile (doesn't handle `-m=value`, `-am` combined flags, `--all=false`), unclear\ninterface (functions accept generic passthru but only care about specific flags), couples core\nlogic to CLI syntax, no type safety (can't type-check \"passthru should contain -a\"), inconsistent\nhandling (some validated, some checked, some filtered), and hard to test (must construct string lists).\n\nUse argparse/click to parse flags explicitly: `-a`/`--all` as `action='store_true'` → `bool`,\n`--amend`/`-v` similarly. Replace `passthru: list[str]` parameters with typed bools (`include_all: bool`).\nCLI framework handles all flag formats, functions declare exact needs, type-safe, and easier testing.\n",
  should_flag: true,
}
