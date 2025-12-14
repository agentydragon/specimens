{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte': [
          {
            end_line: 347,
            start_line: 347,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "AgentsSidebar.svelte line 347 contains a useless historical comment: \"Backdrop\nstyling moved to ModalBackdrop component\". This documents a past refactoring\nrather than explaining current behavior.\n\nProblems: (1) historical note provides no value to readers, (2) ModalBackdrop's\nexistence is already obvious from imports and usage, (3) redundant with \"Modal\nstyles\" section header.\n\nDelete the comment. Historical notes (\"moved to...\", \"used to be...\") clutter\ncode without explaining current behavior. Comments should explain complexity,\nworkarounds, or non-obvious behavior, not document past refactorings.\n",
  should_flag: true,
}
