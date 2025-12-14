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
            end_line: 220,
            start_line: 211,
          },
          {
            end_line: 217,
            start_line: 217,
          },
          {
            end_line: 236,
            start_line: 236,
          },
          {
            end_line: 253,
            start_line: 253,
          },
          {
            end_line: 258,
            start_line: 258,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 211-220 define notify_proposal_change with str signature, but all three callers\n(lines 236, 253, 258) have int proposal_id and must explicitly convert with str().\nThis indicates wrong method signature.\n\nProblem: all callers (create_proposal line 239, approve_proposal line 239, reject_proposal\nline 255) have proposal_id as int in their signatures, persistence layer likely uses\nint, URI formatting at line 217 works fine with int (f-string converts automatically),\nunnecessary conversions add cognitive load.\n\nChange notify_proposal_change signature to accept int instead of str. Callers can then\npass int directly without conversion. Benefits: eliminates unnecessary conversions,\nmakes type consistency clear, aligns with persistence layer.\n\nRelated to issue 022 about using wrong ID in create_proposal.\n',
  should_flag: true,
}
