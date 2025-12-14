{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/lsp/watcher/watcher.go',
        ],
      ],
      files: {
        'internal/lsp/watcher/watcher.go': [
          {
            end_line: 709,
            start_line: 699,
          },
        ],
      },
      note: 'Second `if basePath == ""` branch is unreachable because earlier branch already handled basePath==""; remove the dead branch.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/tui/components/chat/messages/tool.go',
        ],
      ],
      files: {
        'internal/tui/components/chat/messages/tool.go': [
          {
            end_line: 213,
            start_line: 200,
          },
        ],
      },
      note: 'View(): both nested and non-nested branches return the same `box.Render(content)`; remove the conditional and return once.',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Remove unreachable or redundant code paths (dead code). Delete unreachable branches and simplify conditionals that return identical results to avoid confusion and maintenance burden.',
  should_flag: true,
}
