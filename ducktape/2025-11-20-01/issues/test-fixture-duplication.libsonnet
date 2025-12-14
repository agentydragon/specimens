{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/mcp/approval_policy/test_proposals_resources.py',
        ],
      ],
      files: {
        'adgn/tests/mcp/approval_policy/test_proposals_resources.py': [
          {
            end_line: 25,
            start_line: 25,
          },
          {
            end_line: 36,
            start_line: 32,
          },
          {
            end_line: 44,
            start_line: 44,
          },
          {
            end_line: 59,
            start_line: 59,
          },
          {
            end_line: 64,
            start_line: 60,
          },
          {
            end_line: 71,
            start_line: 71,
          },
          {
            end_line: 90,
            start_line: 86,
          },
          {
            end_line: 93,
            start_line: 93,
          },
          {
            end_line: 99,
            start_line: 99,
          },
          {
            end_line: 106,
            start_line: 106,
          },
          {
            end_line: 131,
            start_line: 127,
          },
          {
            end_line: 134,
            start_line: 134,
          },
          {
            end_line: 140,
            start_line: 140,
          },
          {
            end_line: 147,
            start_line: 147,
          },
          {
            end_line: 168,
            start_line: 159,
          },
          {
            end_line: 171,
            start_line: 171,
          },
          {
            end_line: 181,
            start_line: 181,
          },
          {
            end_line: 187,
            start_line: 187,
          },
          {
            end_line: 204,
            start_line: 204,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The test file `test_proposals_resources.py` has significant duplication that should be\nrefactored into fixtures and constants:\n\n**Policy content duplication:**\n- The "allow" policy (class ApprovalPolicy with decision="allow") is duplicated 3+ times\n  across tests (lines 32-36, 60-64, 86-90, 159-163, 176)\n- The "deny_abort" policy appears at lines 127-131\n- The "deny_continue" policy appears at lines 164-168\n- No shared policy constants exist in the codebase for these common test policies\n\n**Client instantiation duplication:**\n- `ApprovalPolicyProposerServer(engine=approval_engine)` created in 6 different tests\n- `ApprovalPolicyAdminServer(engine=approval_engine)` created in 3 tests\n- `ApprovalPolicyServer(approval_engine)` (reader) created in 6 tests\n- Each wrapped individually with `make_typed_mcp` context manager\n\n**Recommended fixes:**\n1. Create module-level constants for common policy strings (POLICY_ALLOW, POLICY_DENY_ABORT,\n   POLICY_DENY_CONTINUE)\n2. Create pytest fixtures or fixture factories for creating typed clients:\n   - `proposer_client` fixture that yields configured proposer client\n   - `admin_client` fixture that yields configured admin client\n   - `reader_client` fixture that yields configured reader client\n   - Or a fixture factory like `make_policy_client(role)` that returns appropriate client\n3. This reduces test boilerplate and makes tests focus on behavior rather than setup\n\nThe duplication makes tests harder to maintain - changes to policy format or client\ninitialization patterns require updates in many places.\n',
  should_flag: true,
}
