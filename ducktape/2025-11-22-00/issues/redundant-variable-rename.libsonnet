{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/policy_eval/runner.py',
        ],
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/policy_eval/runner.py': [
          {
            end_line: 32,
            start_line: 32,
          },
        ],
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 581,
            start_line: 581,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Variables are renamed without adding clarity or semantic meaning.\n\nLocation 1 (runner.py:32): parameter `docker_client` is immediately\nrenamed to `client`. No value added - either rename the parameter itself\nor use `docker_client` throughout.\n\nLocation 2 (cli.py:581): `final_text` is renamed to `content_before`,\nbut both names mean the same thing. Use the semantic name from the start.\n\nProblems: extra variables to track, confusion about which name to use,\nmore code, cognitive load. Fix: use one consistent name throughout.\n',
  should_flag: true,
}
