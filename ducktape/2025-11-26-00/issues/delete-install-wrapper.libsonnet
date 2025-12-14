{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/policy_gateway/middleware.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/policy_gateway/middleware.py': [
          {
            end_line: 298,
            start_line: 279,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 279-298 define `install_policy_gateway()` which is just a wrapper around\nconstructor + `add_middleware()`. This is unnecessary indirection.\n\n**Current pattern:**\n`install_policy_gateway(comp, hub=..., policy_reader=..., ...)` creates a\n`PolicyGatewayMiddleware` instance, calls `comp.add_middleware(middleware)`, and\nreturns the middleware.\n\n**Problem:** This is just a wrapper around `middleware = PolicyGatewayMiddleware(...);\ncomp.add_middleware(middleware)`. Callers can do this themselves in 2 lines.\n\n**Fix:** Delete the function. Callers should do:\n```python\nmiddleware = PolicyGatewayMiddleware(hub=hub, policy_reader=policy_reader, ...)\ncomp.add_middleware(middleware)\n```\n\n**Benefits:**\n1. Fewer functions to maintain\n2. Clearer what's happening - no magic wrapper\n3. Standard pattern (create middleware, add it)\n4. No confusing mutable-state wrapper around compositor\n\n**Docstring claim:** \"This mirrors production wiring in the container; tests should\nreuse this helper to avoid drift.\" This is not a good reason - tests should just\nuse the same 2-line pattern as production. The \"drift\" risk is minimal and the\nindirection cost is higher.\n",
  should_flag: true,
}
