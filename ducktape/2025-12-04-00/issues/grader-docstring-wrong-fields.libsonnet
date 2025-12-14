{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/prompt_optimizer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/prompt_optimizer.py': [
          {
            end_line: 276,
            start_line: 273,
          },
          {
            end_line: 285,
            start_line: 284,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 273, 276, 284-285 in the run_grader tool docstring claim the grader computes "precision" and "metrics" (true_positives/false_positives/false_negatives) and that these are available as grade.precision and grade.metrics in the output. However, the GradeSubmitInput model (grader/models.py:360-485) does not have precision or metrics fields.\n\nThe actual output structure is:\n- grade.recall (the only computed metric)\n- grade.reported_issue_ratios (with tp/fp/unlabeled breakdown)\n- grade.canonical_tp_coverage\n- grade.canonical_fp_coverage\n- grade.novel_critique_issues\n- grade.summary\n\nThe docstring should be corrected to reflect the actual model fields rather than mentioning non-existent precision and metrics fields.\n',
  should_flag: true,
}
