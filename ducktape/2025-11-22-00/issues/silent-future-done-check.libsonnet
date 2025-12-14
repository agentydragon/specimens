{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 189,
            start_line: 185,
          },
          {
            end_line: 203,
            start_line: 199,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "approve() and reject() tools in ApprovalHub check if a future is already done,\nbut silently ignore this case instead of raising an error.\nIf the future is already `.done()`, the code silently:\n- Doesn't set the result\n- Doesn't notify about the problem\n- Returns success status {\"status\": \"approved\"}\n- Could mask race conditions or double-approval bugs\n\nThis can happen (for example) if:\n1. User clicks \"Approve\" twice in quick succession\n2. Two UI clients try to approve the same call_id\n\n**Why this is bad:**\n1. **Hides bugs** (race conditions or double-processing silently ignored)\n2. **Misleading response**: Returns success when request was not processed\n3. **No visibility**: No log, no error, no way to detect the problem occurred\n4. **Data integrity**: The fact that the future was already resolved might indicate\n   a serious bug that should be investigated, not hidden\n\n**Fix:** Raise an error if the future is already done, or at least return a warning in tool result\nto caller. Same fix needed for reject().\n\nBenefits of raising:\n- Fail-fast behavior catches bugs early\n- Clear signal that something unexpected happened\n- Prevents silent corruption of approval state\n- Forces callers to handle the race condition properly\n",
  should_flag: true,
}
