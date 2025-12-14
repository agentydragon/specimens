{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/policy_gateway/middleware.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/policy_gateway/middleware.py': [
          {
            end_line: null,
            start_line: 164,
          },
          {
            end_line: null,
            start_line: 167,
          },
          {
            end_line: null,
            start_line: 225,
          },
          {
            end_line: null,
            start_line: 229,
          },
          {
            end_line: null,
            start_line: 234,
          },
          {
            end_line: null,
            start_line: 238,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 164-168 mint TWO different random IDs for the SAME tool call, making correlation\nbetween persistence records and in-flight tracking impossible.\n\n**The problem:**\nLine 164 creates ID #1 ("pg:" + uuid) for persistence record.\nLine 167 creates ID #2 (bare uuid) for _inflight tracking.\nLine 225 removes using ID #2, breaking the correlation chain.\n\nCannot track: persistence → in-flight → completion under a single ID.\nAlso inconsistent prefix usage ("pg:" vs bare).\n\n**Contrast with ASK case (line 238):** Mints call_id ONCE, then uses it consistently\nfor ApprovalHub, notifications, and persistence (lines 254, 262).\n\n**Fix:** Mint call_id once after policy decision, before branching. All paths (ALLOW,\nDENY_ABORT, DENY_CONTINUE, ASK) use the same ID for persistence, tracking, and cleanup.\nThis eliminates duplication and ensures consistent prefix usage.\n',
  should_flag: true,
}
