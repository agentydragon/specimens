{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: 964,
            start_line: 955,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The loop that strips everything below the Git scissors line and collects non-comment, non-blank lines\nis an ideal small helper for clarity and reuse:\n\n  content_lines: list[str] = []\n  for line in final_content.splitlines():\n    if line.startswith("# ------------------------ >8 ------------------------"):\n      break\n    if line.strip() and not line.strip().startswith("#"):\n      content_lines.append(line)\n\nRefactor into a function (e.g., `extract_message_body(final_content: str) -> list[str]` or\n`is_empty_message(text: str) -> bool`) so the behavior is testable and consistently reused.\n',
  should_flag: true,
}
