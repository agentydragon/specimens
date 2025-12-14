{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/container.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/container.py': [
          {
            end_line: 332,
            start_line: 323,
          },
          {
            end_line: 372,
            start_line: 372,
          },
        ],
      },
      note: 'policy_gateway variable assigned then immediately stored in field. Inline: self._policy_gateway = install_policy_gateway(...)',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 296,
            start_line: 290,
          },
        ],
      },
      note: 'rows and items variables immediately consumed. Inline both into single return statement',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/reducer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/reducer.py': [
          {
            end_line: 201,
            start_line: 200,
          },
        ],
      },
      note: 'tagged variable immediately returned. Inline: return UserMessage.text(f"...")',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 156,
            start_line: 154,
          },
        ],
      },
      note: 'raw variable immediately passed to function. Inline into return statement',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 736,
            start_line: 735,
          },
        ],
      },
      note: 'status variable immediately used in if-check. Inline: if not _format_status_porcelain(repo):',
      occurrence_id: 'occ-4',
    },
  ],
  rationale: 'Multiple locations create intermediate variables that are immediately consumed,\nadding no clarity. These single-use variables should be inlined.\n\n**General pattern:**\nVariables used only once in the next line(s) create unnecessary intermediate state\nwithout improving readability. Inlining makes data flow more direct.\n\n**Benefits of inlining:**\n- Fewer lines of code\n- Direct data flow (no intermediate state to track)\n- Same or better readability\n- Clearer intent (expression used directly where needed)\n',
  should_flag: true,
}
