{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/ToolExec.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/ToolJson.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/ToolExec.svelte': [
          {
            end_line: 51,
            start_line: 40,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ToolJson.svelte': [
          {
            end_line: 33,
            start_line: 33,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "ToolExec.svelte lines 40-51 and ToolJson.svelte line 33 repeatedly cast item.content\nto `any` instead of using proper typed TypeScript models (ExecContent, JsonContent)\nthat already exist in types.ts. ToolExec has `(item.content as any)` repeated 8\ntimes in 13 lines to access cmd, stdout, exit_code, is_error, etc.\n\nProblems: Bypasses TypeScript checking, enables typos that won't be caught, unclear\nwhat fields exist on content, no IDE autocomplete, duplication across components,\ntypes already exist but aren't being used.\n\nUse Svelte reactive statements with discriminated union type guards (check\ncontent_kind === 'Exec'/'Json' first, then TypeScript narrows type automatically).\nBenefits: type safety, no cast duplication, autocomplete, typo protection. Consider\ngenerating TypeScript types from Pydantic models to prevent this class of issues,\nadd ESLint rules discouraging `as any`.\n",
  should_flag: true,
}
