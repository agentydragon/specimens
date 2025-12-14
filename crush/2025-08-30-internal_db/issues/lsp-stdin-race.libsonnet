{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/lsp/transport.go',
        ],
      ],
      files: {
        'internal/lsp/transport.go': [
          {
            end_line: 38,
            start_line: 15,
          },
          {
            end_line: 148,
            start_line: 145,
          },
          {
            end_line: 218,
            start_line: 215,
          },
          {
            end_line: 267,
            start_line: 260,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "LSP client performs unsynchronized concurrent writes to the server's stdin, risking interleaved headers/bodies and JSON‑RPC/LSP stream corruption.\n\nEvidence\n- WriteMessage writes header (fmt.Fprintf) then body (w.Write) with no locking.\n- Multiple goroutines call WriteMessage concurrently:\n  - replying to server requests (WriteMessage(c.stdin, response))\n  - sending requests (WriteMessage(c.stdin, msg))\n  - sending notifications (WriteMessage(c.stdin, msg))\n\nWhy it matters\n- Concurrent fmt.Fprintf + Write to the same pipe can interleave bytes across messages (e.g., header from A + body from B).\n- Results in parse errors, dropped/ misrouted responses, and hard‑to‑debug protocol failures.\n\nContext\n- In typical Crush usage a single agent instance may drive LSP interactions mostly sequentially, so the bug can be latent under light load. However, server‑initiated requests and concurrent notifications still overlap with client calls, and the code provides no serialization. Treat this as bad practice to be fixed regardless of current incidence.\n\nAcceptance criteria\n- Serialize all writes to c.stdin (e.g., add a write mutex on the client and guard all WriteMessage calls).\n- Optional: buffer compose the full frame into a single []byte and write once under the mutex.\n- Add a stress test that concurrently Call/Notify + server replies and validates stream integrity.\n",
  should_flag: true,
}
