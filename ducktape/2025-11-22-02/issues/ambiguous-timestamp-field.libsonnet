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
            end_line: 85,
            start_line: 79,
          },
          {
            end_line: null,
            start_line: 167,
          },
          {
            end_line: null,
            start_line: 189,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The ApprovalItem model has a `timestamp` field whose meaning is ambiguous:\n\n```python\nclass ApprovalItem(BaseModel):\n    \"\"\"A single approval (pending or decided).\"\"\"\n    call_id: str\n    tool_call: ToolCall\n    status: ApprovalStatus\n    reason: str | None = None\n    timestamp: datetime  # What does this represent?\n```\n\nLooking at usage patterns reveals inconsistent semantics:\n- **Pending approvals** (line 167): `timestamp=datetime.now()` - uses current time when building the list\n- **Decided approvals** (line 189): `timestamp=record.decision.decided_at` - uses the decision time\n\nThe field name \"timestamp\" doesn't clarify what event it's timestamping:\n- Is it when the tool call was requested?\n- When the approval decision was made?\n- When the approval item was last updated?\n\nFor decided approvals it's explicitly the decision time (`decided_at`), but for pending approvals it's just \"now\" which is actually neither the request time nor a decision time. This semantic inconsistency makes the field unclear and potentially misleading.\n\n**Fix:**\nRename to be more specific about what is being timestamped. Options include:\n- `updated_at` - if it represents last update time for both states\n- Split into `requested_at` and `decided_at` fields where decided_at is nullable\n- Use a union type with status-specific semantics\n\nThe name should make it clear what temporal event is being recorded, and the semantics should be consistent across both pending and decided states.\n",
  should_flag: true,
}
