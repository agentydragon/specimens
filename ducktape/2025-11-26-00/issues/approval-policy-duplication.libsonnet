{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
        [
          'adgn/src/adgn/agent/server/protocol.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/protocol.py': [
          {
            end_line: 190,
            start_line: 179,
          },
          {
            end_line: 200,
            start_line: 193,
          },
        ],
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 232,
            start_line: 232,
          },
          {
            end_line: 245,
            start_line: 244,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `approval_policy` field appears BOTH as a direct sibling in Snapshot (protocol.py:199)\nAND inside the `details.SnapshotDetails` bundle (protocol.py:188). Construction in\nruntime.py:232, 244-245 passes `approval_policy` to SnapshotDetails and also assigns it\nas a Snapshot sibling.\n\nProblems: (1) Data duplication - same data sent twice. (2) Inconsistency risk - two copies\ncan drift. (3) Confusing semantics - which is authoritative? (4) Larger payloads.\n(5) Related to issue 014 - reinforces that SnapshotDetails bundle is architecturally wrong.\n\nComment on line 229 says "Build preferred details bundle when all components are present",\nsuggesting migration path. Old `approval_policy` sibling was never removed, creating duplication.\n\nCorrect solution: Delete SnapshotDetails bundle entirely and keep fields as direct siblings.\nAlternative (if bundle must stay): Remove `approval_policy` from sibling fields. But\ndirect-sibling approach is cleaner.\n',
  should_flag: true,
}
