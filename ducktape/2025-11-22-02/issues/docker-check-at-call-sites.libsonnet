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
            end_line: 345,
            start_line: 344,
          },
          {
            end_line: 361,
            start_line: 360,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The pattern `if self.docker_client is not None: self.self_check(...)` appears\ntwice (lines 344-345, 360-361). This conditional is repeated at every call site.\n\nThe check should be internal to self_check() itself, not the caller's\nresponsibility. Currently self_check() assumes docker_client is valid (line 342),\nforcing callers to guard it.\n\nFix: Move the None check inside self_check():\n\ndef self_check(self, source: str) -> None:\n    if self.docker_client is None:\n        return  # Skip validation if Docker not available\n    run_policy_source(docker_client=self.docker_client, ...)\n\nThen call sites simplify to: self.self_check(content)\n\nBenefits:\n- Single responsibility: self_check handles its own preconditions\n- DRY: check not repeated at call sites\n- Cleaner API: callers don't need to know about Docker availability\n",
  should_flag: true,
}
