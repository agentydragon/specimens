{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 371,
            start_line: 340,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 340-371 create `master_fd_for_runner` variable to pass to runner and\noutput_task. This can be refactored to avoid the extra variable.\n\n**Current:**\n```python\nif run_precommit:\n    ...\n    precommit_task = asyncio.create_task(...)\n    master_fd_for_runner = master_fd\nelse:\n    precommit_task = asyncio.create_task(asyncio.sleep(0))\n    master_fd_for_runner = None\n\nrunner = cls(..., master_fd_for_runner)\nif master_fd_for_runner is not None:\n    output_task = asyncio.create_task(runner._stream_output(master_fd_for_runner))\n```\n\n**Simplified:**\n```python\nif run_precommit:\n    ...\n    precommit_task = asyncio.create_task(...)\n    output_task = asyncio.create_task(runner._stream_output(master_fd))\nelse:\n    precommit_task = output_task = asyncio.create_task(asyncio.sleep(0))\n\nrunner = cls(..., master_fd if run_precommit else None)\n```\n\nNo need to track `master_fd_for_runner` separately.\n',
  should_flag: true,
}
