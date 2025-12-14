{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
        [
          'adgn/src/adgn/mcp/approval_policy/server.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 82,
            start_line: 82,
          },
          {
            end_line: 89,
            start_line: 84,
          },
          {
            end_line: 102,
            start_line: 101,
          },
          {
            end_line: 110,
            start_line: 109,
          },
          {
            end_line: 156,
            start_line: 156,
          },
          {
            end_line: 167,
            start_line: 162,
          },
          {
            end_line: 181,
            start_line: 178,
          },
          {
            end_line: 206,
            start_line: 204,
          },
          {
            end_line: 211,
            start_line: 209,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 92,
            start_line: 87,
          },
          {
            end_line: 183,
            start_line: 182,
          },
        ],
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 851,
            start_line: 844,
          },
          {
            end_line: 874,
            start_line: 870,
          },
          {
            end_line: 894,
            start_line: 890,
          },
          {
            end_line: 911,
            start_line: 907,
          },
        ],
        'adgn/src/adgn/mcp/approval_policy/server.py': [
          {
            end_line: 100,
            start_line: 96,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The notifier callback pattern across ApprovalHub, ApprovalPolicyEngine, AgentRegistry, and\nsessions has five design problems making it brittle:\n\nProblem 1: Single `_notifier` field replaced by `set_notifier()` supports only one listener\nat a time (not proper observer/pub-sub). Multiple consumers require manual wrappers.\nExamples: ApprovalHub._notifier (line 82), ApprovalPolicyEngine._notify (line 156).\n\nProblem 2: Notifiers typed as sync but documented \"sync and non-blocking (may schedule async\nwork)\" (approvals.py:87, 165). AgentRegistry expects async, forcing `create_task()` wrappers\n(approval_policy/server.py:96-100).\n\nProblem 3: Fire-and-forget `create_task()` swallows or only logs exceptions (agents.py:844-851).\napproval_policy/server.py:100 accesses exception only to prevent asyncio warnings.\n\nProblem 4: Notifiers called without try/except (approvals.py:101-102, 109-110, 178-181). If\nnotifier throws, crashes whole operation.\n\nProblem 5: Inconsistent patterns - some use `if self._notifier:`, others use intermediate `cb`\nvariable (lines 204-206, 209-211) that's pointless.\n\nReplace with async observer pattern: list of async observers, `add_observer()` method,\n`_notify_observers()` that iterates with try/except per observer. Benefits: multiple observers,\nconsistent async/await, explicit exception handling, type-safe.\n",
  should_flag: true,
}
