{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/ServersPanel.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte': [
          {
            end_line: 138,
            start_line: 136,
          },
          {
            end_line: 257,
            start_line: 254,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ServersPanel.svelte': [
          {
            end_line: 197,
            start_line: 185,
          },
          {
            end_line: 257,
            start_line: 257,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "UI components define thin wrapper functions with single or few call sites that add\nno value and should be inlined.\n\n**Pattern: Unnecessary function abstraction for single-use logic**\n\n**1. applyPresetFrom (ServersPanel.svelte:185-197)**\n\nFunction finds a preset by ID and applies its fields to component state. Called only\nonce (line 257). Simple logic (find + assign) with no transformation.\n\nInline the logic in the event handler, or use a Svelte reactive statement\n(`$: if (preset) { ... }`) to automatically apply when preset changes.\n\n**2. open() wrapper (AgentsSidebar.svelte:136-138)**\n\nOne-line function `open(id)` that only calls `setAgentId(id)`. Called at lines 254,\n255, 257. Other places call `setAgentId()` directly (lines 156, 173, 188, 200),\ncreating naming inconsistency.\n\nReplace `open(a.agent_id)` with `setAgentId(a.agent_id)` at call sites. Remove the\nwrapper function.\n\n**Problems with thin wrappers:**\n- Indirection without value (no transformation, validation, or side effects)\n- Naming confusion (two names for same action)\n- Maintenance cost (reader must check if wrapper adds behavior)\n- Inconsistent usage (some places call wrapped function directly)\n- False generalization (abstraction for one use case)\n\n**When wrappers ARE justified:**\n- Multiple operations bundled together\n- Transformation or validation logic\n- Conditional logic before delegation\n- Part of public API / library interface\n- Used from 3+ call sites\n- Testable unit requiring isolation\n- Abstraction hiding implementation details\n\n**When to inline:**\n- Single call site (or only 2-3 sites)\n- Simple pass-through logic (< 10 lines)\n- No tests needed\n- No reuse planned\n\n**General principle: Don't prematurely abstract**\n\nCreate abstractions when you have multiple uses, not \"in case we need it later.\"\nStart inline, extract to function when second use appears.\n\n**Related issue (ServersPanel):**\n\nThe component manually copies fields instead of using types generated from Python\nPydantic models. TypeScript types can be auto-generated from backend ServerSpec via\n`adgn/scripts/generate_types.py` (commit 7c6cae7ad) to prevent drift between frontend\nand backend type definitions.\n",
  should_flag: true,
}
