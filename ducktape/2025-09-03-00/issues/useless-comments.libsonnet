{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: 873,
            start_line: 873,
          },
          {
            end_line: 772,
            start_line: 772,
          },
          {
            end_line: 687,
            start_line: 686,
          },
          {
            end_line: 695,
            start_line: 694,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Comments that add no value: obvious narration, historical notes, or trivial restatements\nof what code already shows. Good comments explain non-obvious decisions; these should\nbe deleted.\n\n**Four categories of useless comments in cli.py:**\n\n**1. Historical/archaeology comment (line 873)**\n"Factor out task creation to a single place" - carries historical intent rather than\npresent-tense information. The refactoring already happened; comment is archaeology.\n\n**2. Trivial narration comments (lines 772, 686-687, 694-695)**\nThree comments that merely restate the next line without adding context:\n- "Detect --amend flag" → next line checks for --amend\n- "Build status string" → next line constructs status string\n- "Print the status" → next line prints output\n\nThe code itself is self-explanatory. Narration comments add noise without information.\n\n**Problems with useless comments:**\n- Add cognitive load when scanning code\n- State the obvious (what code already shows)\n- Historical comments become stale/misleading\n- Make it harder to find valuable comments\n\n**Correct approach: Delete useless comments**\n\nComments should explain non-obvious decisions, edge cases, or rationale not visible\nin code. Delete comments that:\n- Restate what code/naming already shows\n- Carry historical intent (use git history)\n- Are trivial narration of next line\n',
  should_flag: true,
}
