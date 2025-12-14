{
  occurrences: [
    {
      expect_caught_from: [
        [
          'pyright_watch_report.py',
        ],
      ],
      files: {
        'pyright_watch_report.py': [
          {
            end_line: 214,
            start_line: 204,
          },
          {
            end_line: 76,
            start_line: 60,
          },
          {
            end_line: 141,
            start_line: 134,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Default exclude patterns are not recursive, so nested files under these directories are still included.\n\nIn pyright_watch_report.py, excludes like \"build\", \"dist\", and \".mypy_cache\" are used as literal patterns.\nWith fnmatch on relative paths, a pattern of \"dist\" matches only a path named exactly \"dist\" — it does not match\n\"dist/foo.py\". As a result, files within these directories are not excluded.\n\nExample: 'dist/foo.py' will not be excluded by the pattern 'dist'.\n\nNote: Correct fix here would depend on specifics of how the program should behave and potential differences\nin matching semantics between python and pyrightconfig.\n",
  should_flag: true,
}
