{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/registry.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/registry.py': [
          {
            end_line: 106,
            start_line: 102,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "AgentRegistry.close_all() leaves the registry in a partially closed state if any\nAgentRuntime.close() raises. The method loops through _items and calls close() on each\nruntime sequentially without error handling (lines 103-105). If the first close() succeeds\nbut the second raises, the first runtime is closed but the second and all remaining runtimes\nare left open. Additionally, the exception prevents reaching line 106's _items.clear(), so\nthe registry continues holding references to all runtimes (both closed and unclosed). Later\nlookups via get_agent_runtime() return these stale references, mixing closed and open\nruntimes unpredictably.\n",
  should_flag: true,
}
