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
            end_line: 76,
            start_line: 70,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 70-76 construct a `StdioServerParameters` object spread across multiple lines:\n  self._stdio_cm = stdio_client(\n      StdioServerParameters(\n          command=shell,\n          args=args_for_shell,\n          env=env,\n      ),\n  )\n\nThis construction has only three simple keyword arguments (command, args, env), all of which are short variable names. Breaking it across multiple lines adds vertical space without improving readability - the call fits comfortably on one line.\n\nPrefer the single-line form:\n  self._stdio_cm = stdio_client(StdioServerParameters(command=shell, args=args_for_shell, env=env))\n\nThis reduces vertical clutter and keeps the initialization concise. Reserve multi-line formatting for calls with many arguments, long expressions, or complex nested structures where breaking across lines genuinely aids comprehension.\n',
  should_flag: true,
}
