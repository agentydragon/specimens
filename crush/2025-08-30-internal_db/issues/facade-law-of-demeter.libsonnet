{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/tui/page/chat/chat.go',
        ],
      ],
      files: {
        'internal/tui/page/chat/chat.go': [
          {
            end_line: 320,
            start_line: 320,
          },
          {
            end_line: 336,
            start_line: 335,
          },
          {
            end_line: 344,
            start_line: 344,
          },
          {
            end_line: 355,
            start_line: 352,
          },
          {
            end_line: 376,
            start_line: 376,
          },
          {
            end_line: 679,
            start_line: 679,
          },
          {
            end_line: 699,
            start_line: 699,
          },
          {
            end_line: 820,
            start_line: 820,
          },
        ],
      },
      note: 'chat page reaches through p.app.CoderAgent.* and p.app.Sessions.Create(...) in many places; prefer unified agent façade or DI.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/tui.go',
        ],
      ],
      files: {
        'internal/tui/tui.go': [
          {
            end_line: 178,
            start_line: 178,
          },
          {
            end_line: 192,
            start_line: 192,
          },
          {
            end_line: 253,
            start_line: 253,
          },
          {
            end_line: 417,
            start_line: 417,
          },
          {
            end_line: 436,
            start_line: 436,
          },
        ],
      },
      note: 'top-level TUI model uses a.app.CoderAgent.* for busy checks and a.app.Permissions for toggles/grants; centralize agent/permission interactions behind App or DI.',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/editor/editor.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/editor/editor.go': [
          {
            end_line: 149,
            start_line: 144,
          },
          {
            end_line: 240,
            start_line: 240,
          },
          {
            end_line: 333,
            start_line: 333,
          },
          {
            end_line: 647,
            start_line: 647,
          },
        ],
      },
      note: 'editor reaches through to m.app.CoderAgent.IsSessionBusy/IsBusy and m.app.Permissions — consider routing via App façade methods or inject services explicitly.',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'App currently serves as both composition root and partial façade. TUI code reaches through app to call inner services (CoderAgent, Sessions, Permissions) directly, producing duplicated guards and unclear ownership. Pick one strategy: strengthen App as the agent façade (IsAgentBusy/RunAgent/CancelAgent/etc.) or treat App strictly as composition root and pass services by DI consistently.',
  should_flag: true,
}
