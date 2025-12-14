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
            end_line: 609,
            start_line: 601,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'cli.py lines 601-609 contain complex scissors+comment filtering logic buried\ninline: splitlines, loop with startswith checks for scissors_mark and "#",\naccumulate result_lines, join.\n\nProblems: (1) hard to read (mixes control flow with scissors parsing), (2) hard\nto test independently, (3) not reusable (must duplicate if needed elsewhere),\n(4) clutters main function logic.\n\nExtract to helper function extract_commit_content(text, scissors_mark) that\nreturns filtered string. Main function calls: final_content =\nextract_commit_content(edited_content, scissors_mark).\n\nBenefits: Single responsibility, testable independently, reusable, clearer main\nfunction logic, can document edge cases in helper docstring.\n',
  should_flag: true,
}
