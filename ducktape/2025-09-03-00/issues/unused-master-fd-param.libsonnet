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
            end_line: 549,
            start_line: 544,
          },
          {
            end_line: 615,
            start_line: 615,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '`ParallelTaskRunner.__init__(..., master_fd)` accepts `master_fd` but never stores or uses it; the FD is\nonly passed to `_stream_output(master_fd)` at call time. Either drop the parameter from `__init__` (pass the\nFD directly to `_stream_output`) or store it as `self.master_fd` and wire it into actual usage.\n\nThis eliminates a misleading, unused parameter and makes data flow explicit.\n',
  should_flag: true,
}
