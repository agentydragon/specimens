{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/handler.py',
        ],
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
        [
          'adgn/src/adgn/agent/policy_eval/container.py',
        ],
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/handler.py': [
          {
            end_line: 137,
            start_line: 132,
          },
          {
            end_line: 154,
            start_line: 149,
          },
          {
            end_line: 161,
            start_line: 156,
          },
          {
            end_line: 168,
            start_line: 163,
          },
          {
            end_line: 175,
            start_line: 170,
          },
          {
            end_line: 182,
            start_line: 177,
          },
        ],
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: 533,
            start_line: 530,
          },
        ],
        'adgn/src/adgn/agent/policy_eval/container.py': [
          {
            end_line: 58,
            start_line: 58,
          },
        ],
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 55,
            start_line: 55,
          },
          {
            end_line: 58,
            start_line: 58,
          },
          {
            end_line: 176,
            start_line: 176,
          },
          {
            end_line: 680,
            start_line: 680,
          },
          {
            end_line: 683,
            start_line: 683,
          },
          {
            end_line: 687,
            start_line: 687,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Comments that add no value: redundant, obvious, historical, or noise.\n\n**Four categories:**\n\n**1. Redundant "Default: no-op" docstrings** (handler.py, 6 methods)\nHook methods with "Default: no-op" in docstrings when implementation is just\n`return`. Base class hooks are conventionally no-ops; stating this is redundant.\n\n**2. Separator lines and vague labels** (cli.py, 6 locations)\nEmpty "# -------" separators, "# constants" restating obvious naming, and vague\n"# Core logic" that adds no information.\n\n**3. Historical breadcrumbs** (container.py:58)\nComment noting function was moved. Git history is the source of truth for moves.\n\n**4. Documenting removed code** (sqlite.py:530-533)\nFour-line block listing old method names that no longer exist. Git commit messages\nshould document removals.\n\n**Problems:** Add cognitive load, become stale, duplicate visible information,\nreplace proper documentation (git), obscure valuable comments.\n\n**Fix:** Delete these comments. Keep only comments explaining non-obvious decisions\nor rationale not visible in code/naming.\n',
  should_flag: true,
}
