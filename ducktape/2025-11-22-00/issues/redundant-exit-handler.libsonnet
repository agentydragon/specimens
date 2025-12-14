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
            end_line: 660,
            start_line: 660,
          },
          {
            end_line: 734,
            start_line: 733,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "cli.py async_main() (lines 659-734) has a try-except handler that catches\nExitWithCode exceptions only to immediately call sys.exit() with the same code.\nThis adds 4 lines and indents 70+ lines of main logic for no benefit.\n\nProblems: (1) redundant indentation of all main logic, (2) handler doesn't\ntransform, log, or enrich the exit code, (3) misleading - suggests special\nhandling that doesn't exist, (4) verbosity.\n\nRemove the try-except entirely. Let ExitWithCode propagate to the top level;\nPython's default behavior will still terminate with the exit code. Or if clean\nexit is needed, the existing sys.exit() calls at the end are sufficient.\n\nBenefits: 4 fewer lines, one less indent level, clearer code without false\nsuggestion of special handling. Top-level functions typically don't catch their\nown exit exceptions.\n",
  should_flag: true,
}
