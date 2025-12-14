{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_reasoning_threading.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_reasoning_threading.py': [
          {
            end_line: 94,
            start_line: 89,
          },
          {
            end_line: 101,
            start_line: 96,
          },
          {
            end_line: 114,
            start_line: 113,
          },
          {
            end_line: 116,
            start_line: 115,
          },
          {
            end_line: 129,
            start_line: 124,
          },
          {
            end_line: 132,
            start_line: 131,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 89-94, 96-101, 113-116, 124-132 extract list values into intermediate variables\n(fc1, fco1, fc2, fco2) and immediately use them once in assertions. These single-use\nvariables should be inlined directly into the assert_that() calls.\n\nVariables used exactly once add no semantic clarity and make tests longer. Standard\npattern: only extract when used multiple times or when the variable name clarifies\na complex expression. Here fc1/fco1 names don't clarify turn2_input[ri1_idx + 1].\n\nNote: Lines 19-32 fc1/fc2 definitions are fine - they're used in response sequence\nconstruction, not single-use assertions.\n",
  should_flag: true,
}
