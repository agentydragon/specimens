{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/approval_policy/test_policy_resources.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/approval_policy/test_policy_resources.py': [
          {
            end_line: 186,
            start_line: 183,
          },
          {
            end_line: 195,
            start_line: 192,
          },
          {
            end_line: 208,
            start_line: 205,
          },
          {
            end_line: 233,
            start_line: 229,
          },
          {
            end_line: 243,
            start_line: 239,
          },
          {
            end_line: 261,
            start_line: 258,
          },
          {
            end_line: 275,
            start_line: 272,
          },
          {
            end_line: 284,
            start_line: 281,
          },
          {
            end_line: 304,
            start_line: 301,
          },
          {
            end_line: 314,
            start_line: 314,
          },
          {
            end_line: 371,
            start_line: 368,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Throughout test_policy_resources.py, short Pydantic model instantiations (2-3 simple\narguments) are unnecessarily split across multiple lines when they would easily fit\non one line. This makes the tests more verbose without improving readability.\n\n**Examples that should be one line:**\n\nLines 258-261 (user-mentioned example):\n```python\narguments=UpdatePolicyArgs(\n    id=\"nonexistent\",\n    text=\"print('new')\",\n).model_dump(),\n```\nShould be: `arguments=UpdatePolicyArgs(id=\"nonexistent\", text=\"print('new')\").model_dump(),`\n\nLines 183-186, 192-195, 205-208: CreatePolicyArgs with 2 args\nLines 229-233, 239-243: Args with 3 simple string parameters\nLines 272-275, 281-284, 301-304: Args with 2 simple parameters\nLines 314, 368-371: Short args split unnecessarily\n\n**Guideline:**\n- 1-2 arguments: Always one line\n- 3 simple arguments (strings/bools/numbers): Generally one line unless line >100 chars\n- 4+ arguments or complex nested structures: Multi-line acceptable\n\nNote: Lines 84-89, 94-99, 132-137, 160-165 have 4 arguments and could remain multi-line,\nthough they're borderline cases.\n",
  should_flag: true,
}
