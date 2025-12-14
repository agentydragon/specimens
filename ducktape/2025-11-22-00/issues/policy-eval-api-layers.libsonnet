{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/policy_eval/runner.py',
        ],
        [
          'adgn/src/adgn/agent/policy_eval/container.py',
        ],
        [
          'adgn/src/adgn/agent/approvals.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/approvals.py': [
          {
            end_line: 313,
            start_line: 310,
          },
        ],
        'adgn/src/adgn/agent/policy_eval/container.py': [
          {
            end_line: 46,
            start_line: 17,
          },
          {
            end_line: 56,
            start_line: 48,
          },
        ],
        'adgn/src/adgn/agent/policy_eval/runner.py': [
          {
            end_line: 23,
            start_line: 16,
          },
          {
            end_line: 85,
            start_line: 1,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The policy evaluation code has an awkward split between `runner.py` and `container.py`\nwith an inconsistent middle layer.\n\nProblem 1: `run_policy_source()` (runner.py:16-23) takes `input_payload: dict`, which is\nneither a Pydantic model (type-safe, validated) nor raw bytes/string (unparsed). This\nforces callers (container.py:48-56, approvals.py:310-313) to manually convert Pydantic →\ndict at each call site, duplicating serialization logic.\n\nCorrect approach: Take a Pydantic `PolicyRequest` model and serialize inside the function.\nMakes call sites type-safe, validates in one place, callers work with domain types.\n\nProblem 2: `ContainerPolicyEvaluator` (container.py:17-46) is a 40-line wrapper around\n`run_policy_source()`, creating two entrypoints. Both the wrapper and direct callers do\nPydantic→dict conversion, suggesting wrong abstraction layers.\n\nCorrect approach: Merge into one module with single `ContainerPolicyEvaluator` class:\n`decide(request)` evaluates with active policy, `self_check(source)` validates policy,\n`_run_policy(source, request)` private Docker helper. Single type-safe entrypoint,\neliminates duplication, keeps serialization in one place.\n',
  should_flag: true,
}
