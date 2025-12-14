{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/policy_eval/shim.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/policy_eval/shim.py': [
          {
            end_line: 17,
            start_line: 14,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The shim.py module docstring (lines 14-17) says \"Keep this tiny and dependency-free; only stdlib is used\" but this is misleading. While the shim itself uses only stdlib, policy programs routinely import and use types/enums from the `adgn` package, which is installed in the container image.\n\n**Why this is misleading:**\n\nPolicy programs typically use adgn package imports:\n```python\nfrom adgn.agent.policies.policy_types import PolicyDecision\nfrom adgn.mcp._shared.naming import build_mcp_function\nreturn PolicyDecision.ALLOW\n```\n\n**The confusion:**\n\n\"Dependency-free\" could mean:\n1. The shim.py module doesn't import non-stdlib (TRUE)\n2. Policy programs don't use adgn package (FALSE - they do!)\n3. No external packages needed in container (FALSE - adgn is needed)\n\nThe current wording suggests interpretation #2, which is wrong.\n\n**Correct approach:**\n\nClarify what \"dependency-free\" means:\n```python\nNotes:\n- The shim itself only uses stdlib (no third-party imports).\n- Policy programs CAN import from adgn package (installed in container).\n- Container image must have the adgn package installed so both the shim\n  (python -m adgn.agent.policy_eval.shim) and policy programs can use it.\n```\n\nOr simply remove the misleading statement:\n```python\nNotes:\n- Container image must have the adgn package installed for both the shim\n  execution (python -m adgn.agent.policy_eval.shim) and for policy programs\n  to import types/utilities from adgn.\n```\n",
  should_flag: true,
}
