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
            end_line: 44,
            start_line: 40,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "AgentRuntime.close() (lines 40-44) executes two close operations sequentially without\nerror handling: await self.runtime.close() followed by await self.running.close(). If\nthe first call raises, the second never executes, leaving the entire MCP infrastructure\nalive. RunningInfrastructure.close() is responsible for critical cleanup: detaching\nsidecars, closing the AsyncExitStack containing the compositor client, all mounted MCP\nservers, policy reader/approver servers, approval engine infrastructure, and notification\nhandlers. LocalAgentRuntime.close()'s docstring explicitly states it \"Does NOT close the\nunderlying RunningInfrastructure\", making the sequential pattern particularly problematic.\n",
  should_flag: true,
}
