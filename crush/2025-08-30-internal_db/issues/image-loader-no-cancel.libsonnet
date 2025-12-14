{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/tui/components/image/load.go',
        ],
        [
          'internal/tui/components/image/image.go',
        ],
      ],
      files: {
        'internal/tui/components/image/image.go': [
          {
            end_line: 45,
            start_line: 38,
          },
          {
            end_line: 76,
            start_line: 58,
          },
        ],
        'internal/tui/components/image/load.go': [
          {
            end_line: 39,
            start_line: 31,
          },
          {
            end_line: 66,
            start_line: 54,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'TUI image loader uses context.Background() for HTTP fetches and provides no cancellation/timeout, preventing UI-driven aborts and risking hangs on slow endpoints.\n\nEvidence\n- internal/tui/components/image/load.go: http.NewRequestWithContext(context.Background(), ...); http.DefaultClient.Do(req)\n- No cancel func is retained; subsequent redraws/URL updates cannot abort an in-flight fetch.\n\nWhy it matters\n- In a terminal UI, image previews should be best-effort and abortable when the user navigates or resizes.\n- Lack of timeout means slow/misbehaving servers can stall the load path until transport-level timeouts, degrading UX.\n\nAcceptance criteria\n- Derive a bounded context (e.g., context.WithTimeout of 3–5s) for the GET.\n- Retain a cancel func in the image.Model and invoke it on Redraw/UpdateURL to abort prior fetches.\n- Ensure resp.Body is always closed; handle cancellation errors gracefully.\n',
  should_flag: true,
}
