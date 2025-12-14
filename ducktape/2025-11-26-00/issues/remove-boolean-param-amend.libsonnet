{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 547,
            start_line: 539,
          },
          {
            end_line: null,
            start_line: 731,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 539-547 define `_get_previous_message_if_amend()` which takes `is_amend: bool` and returns None if False. Function wraps an if-statement (antipattern).\n\nRemove boolean parameter. Rename to `_get_previous_commit_message()` with non-nullable `str` return type. Move condition to call site (line 731): `previous_message = _get_previous_commit_message(repo) if is_amend else None`. Or inline entirely since it's called only once.\n",
  should_flag: true,
}
