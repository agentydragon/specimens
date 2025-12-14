{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mini_codex/mcp_manager.py': [
          {
            end_line: 71,
            start_line: 61,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'A short-lived variable used only to forward to a single call (e.g., `command = shell; StdioServerParameters(command=command, ...)`) adds noise without value.\n\nPrefer passing expressions directly at the call site or collapsing the small helper into the call, which reduces lines and one-off names the reader must mentally map.\n\nExample: replace\n  command = shell\n  args_for_shell = [...]\n  StdioServerParameters(command=command, args=args_for_shell, ...)\nwith\n  StdioServerParameters(command=shell, args=[...], ...)\n',
  should_flag: true,
}
