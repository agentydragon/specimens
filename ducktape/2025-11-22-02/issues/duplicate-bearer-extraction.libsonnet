{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/auth.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/auth.py': [
          {
            end_line: 91,
            start_line: 75,
          },
          {
            end_line: 161,
            start_line: 144,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Both TokenAuthMiddleware and UITokenAuthMiddleware duplicate the same\nBearer token extraction logic:\n\nTokenAuthMiddleware.dispatch() (lines 75-91):\n- Check if Authorization header exists\n- Split on whitespace\n- Validate format is \"Bearer <token>\"\n- Extract the token (parts[1])\n\nUITokenAuthMiddleware.__call__() (lines 144-161):\n- Same exact pattern with slightly different error handling\n\nThis is classic code duplication. Both implementations:\n1. Check if Authorization header exists\n2. Split on whitespace\n3. Validate format is \"Bearer <token>\"\n4. Extract the token (parts[1])\n\nFix options:\n1. Extract a shared helper function: extract_bearer_token(auth_header)\n   that returns (token | None, error_dict | None)\n\n2. Preferred: Use FastMCP's authentication patterns if available\n   (investigate if FastMCP provides built-in Bearer token middleware,\n   authentication dependency injection, or standard auth utilities)\n\n3. Consolidate middleware: if both are doing the same thing (Bearer\n   token validation), consider a single parameterized middleware:\n   BearerTokenMiddleware(token_validator: Callable)\n\nMost modern Python web frameworks (FastAPI, Starlette, etc.) provide\nstandardized auth patterns. If FastMCP builds on these, use the provided\npatterns instead of rolling custom middleware.\n\nThis eliminates the duplication entirely by extracting or unifying the\ntwo use cases.\n",
  should_flag: true,
}
