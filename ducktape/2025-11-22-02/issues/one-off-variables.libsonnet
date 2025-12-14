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
            end_line: null,
            start_line: 160,
          },
          {
            end_line: null,
            start_line: 169,
          },
          {
            end_line: 204,
            start_line: 196,
          },
          {
            end_line: 216,
            start_line: 215,
          },
          {
            end_line: 228,
            start_line: 227,
          },
          {
            end_line: 393,
            start_line: 382,
          },
        ],
      },
      note: 'Line 160: pending_map assigned from self.pending, used once at line 169; Line 169: pending_map.items() should be self.pending.items(); Lines 196-204: approvals_list assigned sorted() result, used once in return; Lines 215-216: decision = ContinueDecision(...); self.resolve(...) should inline; Lines 227-228: decision = DenyContinueDecision(...); self.resolve(...) should inline; Lines 382-393: proposals assigned from persistence.list_policy_proposals, used once in list comprehension',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/scripts/generate_frontend_code.py',
        ],
      ],
      files: {
        'adgn/scripts/generate_frontend_code.py': [
          {
            end_line: 186,
            start_line: 183,
          },
          {
            end_line: null,
            start_line: 255,
          },
          {
            end_line: 274,
            start_line: 268,
          },
        ],
      },
      note: 'Lines 183-186: get_json_schema helper wraps TypeAdapter().json_schema(), used once at line 250; Line 255: main_schema dict comprehension assigned and immediately used to update all_defs; Lines 268-274: ts_output list created empty then imperatively appended; should use list literal',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: "Multiple unnecessary one-off variables should be inlined. Each variable is assigned once and used exactly once in the next line or expression, adding no value:\n- They're not reused elsewhere\n- They don't improve readability\n- They don't capture intermediate computations that are referenced multiple times\n- They add extra names that readers must track unnecessarily\n\n**Fix:** Inline each expression directly at its single use site.\n",
  should_flag: true,
}
