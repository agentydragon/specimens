{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/servers/agents.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/servers/agents.py': [
          {
            end_line: 689,
            start_line: 672,
          },
          {
            end_line: 651,
            start_line: 642,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `abort_run` function (lines 672-689) is a trivial alias that wraps `abort_agent` (lines 642-651), adding only a `SimpleOk` return value. It should be deleted. The 15-line docstring makes the function appear more substantial than the 2-line implementation.\n\n**Why this is problematic:**\n\n1. **Unnecessary alias**: The function just calls `abort_agent` and wraps the result in `SimpleOk`.\n   This provides no value - callers should just call `abort_agent` directly.\n\n2. **Confusing API**: Having two functions that do the same thing creates confusion about which\n   one to use. Is there a semantic difference? (No, the docstring admits it's just an alias.)\n\n3. **Return type inconsistency**: `abort_agent` returns `None`, `abort_run` returns `SimpleOk`.\n   This is described as \"for consistency\" but it's actually inconsistent - now there are two\n   different return types for the same operation.\n\n4. **Verbose docstring for trivial code**: The 15-line docstring describes a 2-line function.\n   The docstring has:\n   - Summary line\n   - Detailed explanation\n   - Args section\n   - Returns section\n   - Raises section\n\n   For a function that literally just calls another function and wraps the result.\n\n5. **Misleading docstring**: Says \"This is a semantic alias for abort_agent that returns SimpleOk\n   for consistency.\" What consistency? If it's just an alias, why does it exist?\n\n6. **YAGNI violation**: There's no evidence that this alias is needed. If some callers prefer\n   `SimpleOk` return type, they can wrap it themselves.\n\n**Recommended fix:**\n\nDelete lines 672-689 entirely. Callers should use `abort_agent` directly and wrap in `SimpleOk` at the call site if needed.\n\n**Benefits:**\n- Simpler API with one clear way to abort\n- No confusion about which function to use\n- Less code to maintain\n- No verbose docstring for trivial wrapper\n- Consistent return types (abort operations return None)\n\n**Note:**\nIf this alias exists because some callers specifically need `SimpleOk`, that's a code smell.\nThe caller should handle the wrapping, not create a duplicate function in the API.\n",
  should_flag: true,
}
