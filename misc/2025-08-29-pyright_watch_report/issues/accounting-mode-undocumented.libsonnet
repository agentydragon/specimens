{
  occurrences: [
    {
      expect_caught_from: [
        [
          'pyright_watch_report.py',
        ],
      ],
      files: {
        'pyright_watch_report.py': [],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Clarify accounting: first‑match vs all‑matches\n\nOverlapping patterns mean a file may match multiple include/exclude patterns.\nThere are at least 2 reasonable valid attribution modes:\n- First‑match wins (config order): attribute a file to the first include pattern that matches. Useful for "unique additional" counts; order‑sensitive and easy to explain.\n- All‑matches: count a file under every pattern it matches. Useful for coverage/overlap analysis; order‑insensitive.\n\nIn the code as written, first‑match wins (order‑sensitive).\nAll‑matches would have been a valid alternative; as such, the semantics of attribution stats is not obvious if it does not state the attribution mode.\n\nDocument the chosen mode in output to avoid confusion.\n',
  should_flag: true,
}
