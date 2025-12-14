{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/approval_policy/engine.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/approval_policy/engine.py': [
          {
            end_line: 385,
            start_line: 384,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'In _load_instructions(), the `tmpl` variable is assigned on one line and used\nimmediately on the next line. This trivial variable adds no clarity and should\nbe inlined:\n\nCurrent code (lines 384-385):\n  tmpl = Template(raw)\n  rendered = tmpl.render(...)\n\nShould be:\n  rendered = Template(raw).render(...)\n\nThe inline form fits easily on one line and eliminates an unnecessary variable.\n',
  should_flag: true,
}
