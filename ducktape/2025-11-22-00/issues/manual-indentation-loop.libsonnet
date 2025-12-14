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
            end_line: 574,
            start_line: 573,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Manual loop to indent lines instead of using `textwrap.indent()` from standard library.\n\n**Current code (cli.py:573-574):**\n```python\nfor line in previous_message.splitlines():\n    final_text += f"# {line}\\n"\n```\n\n**Problems:**\n- Reimplements standard library functionality\n- More verbose than stdlib solution\n- Harder to test independently\n- Potential edge cases not handled (empty lines, trailing newlines)\n\n**Correct approach:**\n```python\nfinal_text += textwrap.indent(previous_message, "# ", lambda line: True)\n```\n\n**Benefits:**\n- Uses standard, tested library function\n- More concise (1 line vs 2 lines)\n- Clearer intent (obviously indenting text)\n- Handles edge cases correctly\n',
  should_flag: true,
}
