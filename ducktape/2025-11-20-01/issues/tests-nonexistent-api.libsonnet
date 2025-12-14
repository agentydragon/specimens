{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/approval_policy/test_policy_resources.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/approval_policy/test_policy_resources.py': [
          {
            end_line: 384,
            start_line: 1,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The test file `adgn/tests/mcp/approval_policy/test_policy_resources.py` tests a policy\nCRUD API that was never implemented in the production code.\n\n**Problem:**\nThe test imports and uses types that don't exist in the codebase:\n- `CreatePolicyArgs` - for creating policies via admin tools\n- `UpdatePolicyArgs` - for updating policies\n- `DeletePolicyArgs` - for deleting policies\n\nThese test a full policy CRUD (Create, Read, Update, Delete) API that was apparently\nplanned but never implemented. The actual ApprovalPolicyAdminServer only provides:\n- Proposal management: create_proposal, approve_proposal, reject_proposal\n- Policy operations: set_policy, validate_policy, reload_policy\n\nThere is no separate \"create_policy\", \"update_policy\", or \"delete_policy\" tool/functionality.\nThe test file appears to be a placeholder or leftover from an earlier design.\n\n**Evidence:**\n- Test imports CreatePolicyArgs, UpdatePolicyArgs, DeletePolicyArgs (line 11-14)\n- All test classes (TestPolicyListResource, TestPolicyDetailResource, TestCreatePolicyTool,\n  TestUpdatePolicyTool, TestDeletePolicyTool, TestPolicyPagination, TestErrorHandling)\n  reference these non-existent types\n- The production code uses a different model: policies are managed through proposals\n  (create → approve) rather than direct CRUD operations\n\n**Resolution:**\nDelete this test file entirely. It tests functionality that was never built and would\nrequire significant production code implementation to make valid. The actual policy\nfunctionality is tested in test_policy_validation_reload.py and test_proposals_resources.py.\n\n**Alternative considerations:**\n- If direct policy CRUD is desired, it should be implemented in production code first\n- The test could be kept as a specification/TODO, but it's confusing to have failing\n  tests for unimplemented features in the main test suite\n- Better to track this as a feature request in documentation rather than broken tests\n",
  should_flag: true,
}
