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
            end_line: 55,
            start_line: 55,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Constants representing timeouts should carry units in their type or name. `_DEFAULT_TIMEOUT: float | None = None` is ambiguous about units.\n\nPrefer one of two patterns:\n  - Use a timedelta, e.g. `DEFAULT_TIMEOUT = timedelta(seconds=30)`, and name it DEFAULT_TIMEOUT.\n  - If storing a numeric value, include the unit in the name and type, e.g. `DEFAULT_TIMEOUT_S: int | None = None`.\n\nBenefits: reduces confusion about whether a timeout is seconds, milliseconds, or fractional seconds; makes call sites clearer and avoids silent misconfigurations.\n',
  should_flag: true,
}
