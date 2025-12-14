{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/approval_policy/engine.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/approval_policy/engine.py': [
          {
            end_line: 568,
            start_line: 566,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The active_policy() resource handler unnecessarily calls get_policy() which\nreturns a tuple (source, version), then unpacks and discards the version:\n\nCurrent code (lines 566-568):\n  def active_policy() -> str:\n      content, _version = self.get_policy()\n      return content\n\nThis is awkward and requires unpacking a tuple just to discard half of it.\nSince the function only needs the policy source, it should directly access\nthe private field:\n\n  def active_policy() -> str:\n      return self._policy_source\n\nNote: get_policy() has legitimate users that need both source and version\n(tests in test_preset_policy_loading.py verify version increments). But this\nresource handler only needs the source.\n\nSimilar pattern exists in agent/policy_eval/container.py:38, but that's in\na different context (agent layer calling into MCP layer).\n",
  should_flag: true,
}
