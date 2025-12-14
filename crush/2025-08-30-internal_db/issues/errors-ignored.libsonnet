{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/tui/tui.go',
        ],
      ],
      files: {
        'internal/tui/tui.go': [
          {
            end_line: 168,
            start_line: 161,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Errors are ignored in operational code, hiding failures and making diagnosis difficult.\n\nExample\n- internal/tui/tui.go: List sessions in a command handler discards the error (`allSessions, _ := a.app.Sessions.List(context.Background())`).\n\nWhy it matters\n- Swallowing errors causes silent feature breakage and confusing UX; upstream systems cannot react or present actionable messages.\n\nAcceptance criteria\n- Do not ignore errors. Handle or log explicitly; in TUI, return an errMsg so the UI can inform the user.\n- If the code cannot proceed sensibly without the value, fail fast. Prefer returning an error; if you absolutely cannot propagate, panic is acceptable over silently swallowing.\n- Prefer passing a caller context (with cancellation) rather than context.Background() where possible.\n',
  should_flag: true,
}
