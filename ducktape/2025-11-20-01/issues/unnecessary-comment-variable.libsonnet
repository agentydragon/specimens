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
            end_line: 88,
            start_line: 86,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Single-use variable with redundant comment.\n\nLines 86-88 in test_policy_validation_reload.py create a variable `new_policy` that is used only once. The comment \"Save a policy to persistence\" is redundant since the code is self-documenting.\n\nShould inline: `await persistence.set_policy(engine.agent_id, content=\"print('from persistence')\")`\n",
  should_flag: true,
}
