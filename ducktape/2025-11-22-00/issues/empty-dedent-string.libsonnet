{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/system_message.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/system_message.py': [
          {
            end_line: 28,
            start_line: 28,
          },
          {
            end_line: 56,
            start_line: 56,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 28 defines `_APPROVALS_AND_TOOLS = dedent("").strip()`, which always evaluates to empty\nstring `""`. Line 56 includes this in `"\\n\\n".join([_BASE, _APPROVALS_AND_TOOLS, _OUTPUT_STYLE, _HOUSE_RULES])`.\n\nThis is dead code: `dedent("").strip()` performs no-op transformations on empty string, and\njoining with empty element adds no content but suggests placeholder "in case we need it later".\n\nDelete the constant definition (line 28) and remove it from the join list (line 56). If content\nis truly planned for later, add explicit TODO comment with owner and conditionally insert into\njoin only when non-empty.\n',
  should_flag: true,
}
