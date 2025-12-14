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
            end_line: 35,
            start_line: 34,
          },
        ],
      },
      note: 'Import onMount/onDestroy on line 35, after comments and far below other imports (lines 2-13)',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/ApprovalsPanel.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/ApprovalsPanel.svelte': [
          {
            end_line: 27,
            start_line: 26,
          },
          {
            end_line: 32,
            start_line: 32,
          },
        ],
      },
      note: 'Import hljs on line 27, ProposalCard on line 32, both after comments and code',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/JsonDisclosure.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/JsonDisclosure.svelte': [
          {
            end_line: 11,
            start_line: 11,
          },
        ],
      },
      note: 'Import onMount on line 11, after other imports and declarations',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/ToolJson.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/ToolJson.svelte': [
          {
            end_line: 25,
            start_line: 24,
          },
        ],
      },
      note: 'Import zod on line 25, after comments and component logic',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/ServersPanel.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/ServersPanel.svelte': [
          {
            end_line: 20,
            start_line: 18,
          },
        ],
      },
      note: 'Import JSONFormatter on line 20, after comments and state declarations',
      occurrence_id: 'occ-4',
    },
  ],
  rationale: 'Five Svelte components have imports scattered after comments, state declarations,\nor logic instead of at the top of the `<script>` block.\n\n**Examples:**\n- AgentsSidebar line 35: `import { onMount, onDestroy }` far below other imports (lines 2-13)\n- ApprovalsPanel lines 27, 32: two imports after comments/code\n- JsonDisclosure line 11: `import { onMount }` after other imports/declarations\n- ToolJson line 25: `import { z }` after comments/logic\n- ServersPanel line 20: `import JSONFormatter` after comments/state\n\n**Problems:**\n- Violates JS/TS convention (all imports at top)\n- Harder to track dependencies (must scan entire file)\n- Conflicts with ESLint/Prettier import ordering rules\n- Mental overhead distinguishing imports from runtime code\n\n**Fix:** Move all imports immediately after `<script>` tag. Standard order:\nexternal libraries, internal modules, components, types. ESLint `import/order`\ncan enforce automatically.\n',
  should_flag: true,
}
