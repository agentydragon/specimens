{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/container.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/container.py': [
          {
            end_line: 197,
            start_line: 197,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 197 in container.py types `_policy_gateway` as `Any | None` with a comment\nindicating it should be `PolicyGatewayMiddleware`, but doesn't use the proper type.\n\n**Problems:**\n1. Loss of type safety - `Any` defeats type checking\n2. Misleading comment - if we know the type, use it in the annotation\n3. IDE limitations - no autocomplete or type hints when using this field\n4. Maintenance burden - comment can drift from reality\n\n**Fix:** Import `PolicyGatewayMiddleware` from `adgn.mcp.policy_gateway.middleware`\nand change the type annotation to `PolicyGatewayMiddleware | None`. Remove the comment.\n\nThis enables proper type checking, IDE support, and makes the code self-documenting.\n",
  should_flag: true,
}
