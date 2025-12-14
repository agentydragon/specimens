{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/policy_gateway/signals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/policy_gateway/signals.py': [
          {
            end_line: 60,
            start_line: 56,
          },
          {
            end_line: 93,
            start_line: 62,
          },
          {
            end_line: 116,
            start_line: 116,
          },
          {
            end_line: 119,
            start_line: 119,
          },
          {
            end_line: 122,
            start_line: 122,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 62-93 define _coerce_error_data that tries to coerce various error representations\nto mtypes.ErrorData with extensive defensive fallbacks. Lines 56-60 define a Protocol\nfor attribute-based fallback. This overly defensive function should be deleted entirely.\n\nProblems: swallows validation errors and tries manual construction (lines 75-85), has\nattribute-based fallback for objects with .code/.message (lines 87-92), mixes validation\nwith data extraction, violates fail-fast principle, makes debugging harder.\n\nDelete _coerce_error_data and _ErrorFields Protocol. Replace three usage sites (lines\n116, 119, 122) with direct mtypes.ErrorData.model_validate() calls. If data doesn't\nmatch schema, Pydantic raises clear validation errors instead of silently constructing\nminimal ErrorData or returning None.\n",
  should_flag: true,
}
