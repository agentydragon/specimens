{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/llm/tools/glob.go',
        ],
      ],
      files: {
        'internal/llm/tools/glob.go': [
          {
            end_line: 18,
            start_line: 18,
          },
          {
            end_line: 166,
            start_line: 164,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Glob tool documentation claims sorting by modification time, but implementation sorts by path length.\n\nDocumentation at line 18 (in tool description shown to LLM agent):\n"returning matching paths sorted by modification time (newest first)"\n\nActual implementation at lines 164-166:\nsort.SliceStable(matches, func(i, j int) bool {\n    return len(matches[i]) < len(matches[j])\n})\n\nThe code sorts by path length (shortest paths first), not by file modification time. No mtime checking or stat calls are present.\n\nImpact:\n- Agent receives misleading tool description and may make incorrect planning decisions\n- Agent might expect recently modified files when developing iterative search strategies\n- Agent gets shortest-path-first ordering (e.g., "main.go" before "internal/app/very/nested/file.go")\n- Truncation at 100 files returns shortest paths, not most relevant/recent files\n\nFix: Either implement mtime sorting (stat files, sort by mtime desc) or update tool description to accurately describe length-based sorting.\n',
  should_flag: true,
}
