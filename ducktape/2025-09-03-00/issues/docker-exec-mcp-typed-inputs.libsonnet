{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py': [
          {
            end_line: 250,
            start_line: 200,
          },
          {
            end_line: 112,
            start_line: 88,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Docker Exec MCP tool inputs should be declared as strongly-typed (Pydantic) parameters on the FastMCP\ntool function, so validation is handled by the framework and schemas are auto-exported to MCP clients.\n\nCurrent pattern (manual dict/field extraction in call_tool) leads to ad-hoc checks and coercions.\n\nFastMCP-idiomatic pattern (two options):\n- Single Pydantic payload model:\n    @app.tool()\n    async def docker_exec(payload: ExecInputs) -> ExecResultPayload: ...\n  where ExecInputs is a Pydantic BaseModel with strict field types.\n- Separate strongly-typed parameters:\n    @app.tool()\n    async def docker_exec(cmd: list[str], timeout_secs: float | None = None, ...) -> ExecResultPayload: ...\n\nRequired input typing (minimum):\n- cmd: list[str] (non-empty)\n- cwd: str | None\n- env: dict[str, str] | None (values must be strings; reject non-strings)\n- user: str | None\n- tty: bool (no truthy-string coercion)\n- shell: bool (no truthy-string coercion)\n- timeout_secs: float | None (>= 0; no string coercion)\n\nBenefits:\n- Validation moves to FastMCP/Pydantic; no manual coercion.\n- JSON Schema for the tool is generated directly from the Pydantic model and visible to MCP clients.\n- Clear, self-documenting contracts; fewer runtime surprises.\n\nAcceptance criteria:\n- Define a Pydantic BaseModel ExecInputs with the fields above (strict types; min_items=1 for cmd).\n- Change the FastMCP registration to use a typed tool signature (either payload model or per-arg types).\n- Remove manual extraction/coercion in call_tool; rely on Pydantic validation (any invalid inputs must raise).\n- Keep existing shell/timeout composition logic, but operate only on already-validated, correctly-typed values.\n',
  should_flag: true,
}
