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
            end_line: 148,
            start_line: 142,
          },
          {
            end_line: 322,
            start_line: 316,
          },
          {
            end_line: 349,
            start_line: 337,
          },
          {
            end_line: 366,
            start_line: 351,
          },
          {
            end_line: 370,
            start_line: 367,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Several methods in ApprovalHub and ApprovalPolicyEngine are called ONLY by their\ncorresponding MCP tools/resources, and nowhere else in production code:\n\n1. ApprovalHub.resolve() - only called by approve/reject tools (lines 142, 148)\n2. ApprovalPolicyEngine.set_policy() - only called by set_policy tool (lines 316, 322)\n3. ApprovalPolicyEngine.create_proposal() - only called by create_proposal tool (lines 337, 349)\n4. ApprovalPolicyEngine.approve_proposal() - only called by approve_proposal tool (lines 351, 366)\n5. ApprovalPolicyEngine.reject_proposal() - only called by reject_proposal tool (lines 367, 370)\n\nThese are unnecessary abstractions - the methods exist solely to be called by\ntheir corresponding MCP tool, with no other callers.\n\nFix: Inline these methods directly into their MCP tool/resource implementations.\n\nExample for ApprovalHub.resolve():\n\nBefore:\ndef resolve(self, call_id: str, decision: ...) -> None:\n    pending = self._pending.pop(call_id, None)\n    ...\n\n@self.tool()\nasync def approve(...):\n    self.resolve(call_id, decision)\n\nAfter:\n@self.tool()\nasync def approve(...):\n    # Inline resolve logic\n    pending = self._pending.pop(call_id, None)\n    ...\n\nBenefits:\n- Removes unnecessary indirection\n- Makes tool implementation self-contained and easier to understand\n- Reduces method count in the class\n- Clearer that this is the ONLY place this logic is used\n\nNote: Methods like await_decision(), get_policy(), load_policy(), and self_check()\nshould NOT be inlined - they're called externally by production code.\n",
  should_flag: true,
}
