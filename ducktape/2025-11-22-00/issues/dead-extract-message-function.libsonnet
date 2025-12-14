{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/core.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/core.py': [
          {
            end_line: 263,
            start_line: 260,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "core.py _extract_message_from_text() (lines 260-263) appears to be unused dead\ncode. The function extracts text between <message> tags using regex.\n\nProject-wide search shows zero usages (only the definition appears). The current\nprompt in build_prompt() instructs the AI to wrap messages in <message> tags,\nbut backends don't appear to use this helper for parsing. Extraction was likely\nmoved elsewhere or backends parse tags directly.\n\nDelete the function. Keeping unused code: (1) misleads readers about how\nmessages are extracted, (2) clutters the codebase, (3) creates maintenance\nburden, (4) causes doubt about whether it should be called.\n\nIf extraction logic is actually needed, deletion will cause an import error that\nmakes the dependency explicit.\n",
  should_flag: true,
}
