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
            end_line: 78,
            start_line: 75,
          },
          {
            end_line: 94,
            start_line: 94,
          },
          {
            end_line: 98,
            start_line: 98,
          },
          {
            end_line: 105,
            start_line: 104,
          },
          {
            end_line: 114,
            start_line: 111,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "ApprovalHub maintains two parallel dicts keyed by call_id (lines 75-78): `_futures` and\n`_requests`. They must be kept in sync manually, which is error-prone.\n\n**Evidence of parallel management:**\n- Line 94: `self._requests[call_id] = request`\n- Line 98: `self._futures[call_id] = fut`\n- Lines 104-105: both dicts popped together\n- Lines 95-96: checking futures but not requests (asymmetry suggests potential bugs)\n\n**Why parallel dicts are problematic:**\n- Synchronization burden: must keep both dicts in sync manually\n- Error-prone: easy to update one dict and forget the other\n- Unclear lifecycle: not obvious entries come and go together\n- No type safety: can't enforce both dicts have same keys\n\n**Fix:** Create a `PendingApproval` dataclass with `request` and `future` fields, use a\nsingle `_pending: dict[str, PendingApproval]`. Update methods to work with the unified\nstructure. The `pending` property (lines 111-114) extracts requests from dataclass entries.\nBenefits: single source of truth, impossible to have mismatched state, type-safe, clearer\nlifecycle, easier to extend.\n",
  should_flag: true,
}
