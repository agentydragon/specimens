{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/compositor/setup.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/compositor/setup.py': [
          {
            end_line: 30,
            start_line: 29,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 29-30 contain useless comments documenting historical implementation details.\n\nThe comments explain that gateway_client parameter is \"no longer used\" and describe\ninternal implementation changes. Historical notes and internal implementation rationale\ndon't help readers understand current behavior. Delete them.\n",
  should_flag: true,
}
