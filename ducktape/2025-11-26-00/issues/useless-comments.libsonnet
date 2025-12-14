{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/ChatPane.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte': [
          {
            end_line: 73,
            start_line: 73,
          },
          {
            end_line: 86,
            start_line: 86,
          },
          {
            end_line: 89,
            start_line: 89,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ChatPane.svelte': [
          {
            end_line: 79,
            start_line: 79,
          },
          {
            end_line: 84,
            start_line: 84,
          },
          {
            end_line: 107,
            start_line: 107,
          },
        ],
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 484,
            start_line: 484,
          },
          {
            end_line: 719,
            start_line: 717,
          },
          {
            end_line: 722,
            start_line: 722,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Three files have comments that merely restate what the code obviously does. Python\nexamples in cli.py lines 484, 717-719, 722: \"Capture -a/--all\", \"Parse flags from\npassthru\", \"Logging and config\" just describe the next lines. TypeScript examples\nin AgentsSidebar.svelte lines 73, 86, 89 and ChatPane.svelte lines 79, 84, 107:\n\"Get singleton MCP client\" → getMCPClient(), \"Subscribe to agents list updates\"\n→ subscribeToResource, etc.\n\nProblems: Noise makes code harder to scan, redundant with well-named functions,\nmaintenance burden (must update when code changes), no added value (don't explain\nrationale, caveats, or non-obvious behavior).\n\nDelete all these comments. Only add comments explaining WHY something is done,\ncaveats, workarounds, or complex logic that isn't self-evident. Benefits: cleaner\nscannable code, no maintenance overhead, focus on actual insights when present.\n",
  should_flag: true,
}
