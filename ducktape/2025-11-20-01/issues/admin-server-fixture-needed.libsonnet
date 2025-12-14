{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_policy_validation_reload.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_policy_validation_reload.py': [
          {
            end_line: null,
            start_line: 43,
          },
          {
            end_line: null,
            start_line: 56,
          },
          {
            end_line: null,
            start_line: 70,
          },
          {
            end_line: null,
            start_line: 90,
          },
          {
            end_line: null,
            start_line: 107,
          },
          {
            end_line: null,
            start_line: 122,
          },
          {
            end_line: null,
            start_line: 133,
          },
          {
            end_line: null,
            start_line: 146,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Repeated admin_server creation should be a shared fixture.\n\nEvery test creates its own `ApprovalPolicyAdminServer(engine=engine)`. This appears at lines 43, 56, 70, 90, 107, 122, 133, 146.\n\nShould be a fixture that depends on the `engine` fixture.\n\nBenefits:\n- DRY principle\n- Consistent setup across tests\n- Easy to modify server configuration\n',
  should_flag: true,
}
