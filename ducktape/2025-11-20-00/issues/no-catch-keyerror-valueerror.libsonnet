{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/mcp_routing.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/mcp_routing.py': [
          {
            end_line: 148,
            start_line: 146,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Middleware explicitly catches KeyError and ValueError, converting to 500 responses\n(mcp_routing.py:146-148):\n\nexcept (KeyError, ValueError) as e:\n    logger.error(f"Routing error: {e}")\n    return Response(content=str(e), status_code=500)\n\nProblems:\n- Catches exceptions that indicate bugs, not expected errors\n- Masks real issues by returning 500 instead of propagating\n- No stack trace in response (only logged)\n- Inconsistent: other exceptions propagate up\n\nShould either:\n1. Remove try/except, let framework handle unhandled exceptions\n2. Install global error handling middleware if custom 500 responses needed\n3. Only catch specific expected exceptions with proper error responses\n\nKeyError accessing token_info["role"] means invalid TOKEN_TABLE data (bug).\nValueError converting TokenRole means invalid data in table (bug).\n\nThese should fail fast, not return generic 500. Framework should handle\nunexpected exceptions consistently across all endpoints.\n\nIf custom error responses needed, use Starlette exception handlers or\nmiddleware, not scattered try/except blocks.\n',
  should_flag: true,
}
