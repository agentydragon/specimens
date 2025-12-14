{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 402,
            start_line: 399,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "AgentSession._run_impl builds and sends a snapshot before setting self.active_run. Line 399\ncalls `await self._manager.send_payload(await self.build_snapshot())` but self.active_run isn't\nassigned until line 400-402. Since build_snapshot only includes run metadata when\nself.active_run is non-None, the startup snapshot always contains active_run_id=None, empty\npending_approvals, and no SnapshotDetails. UI clients reading the snapshot resource never learn\nthat a run started until the next snapshot emission (typically at run completion). The\nactive_run assignment should be moved before the build_snapshot call so the snapshot accurately\nreflects that a run is active.\n",
  should_flag: true,
}
