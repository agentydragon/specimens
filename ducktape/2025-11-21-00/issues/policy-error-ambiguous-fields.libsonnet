{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/models/policy_error.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/models/policy_error.py': [
          {
            end_line: 24,
            start_line: 23,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 23-24 define `index` and `length` fields in `PolicyError` with ambiguous descriptions:\n\"Character/token index where error occurred\" and \"Length of error span in characters/tokens\".\n\nThe descriptions don't specify whether values are character indices or token indices. Is\n`index=10` the 10th character or 10th token? How does the consumer know which? No way to\ndistinguish makes the fields meaningless. Same problem for `length=5` (five characters or\nfive tokens?).\n\nThere's no evidence these fields are populated or consumed anywhere in the codebase. They\nprovide unnecessary detail. Different error sources might use different interpretations,\nmaking the fields inconsistent and unreliable.\n\nRemove both fields. The existing `message` field can include location details when needed\n(e.g., \"Parse error at line 5, column 10\"). Benefits: eliminates unusable ambiguous fields,\nsimpler model, clearer focus on stage/code/message.\n",
  should_flag: true,
}
