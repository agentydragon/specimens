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
            end_line: 327,
            start_line: 314,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 314-327 have `await asyncio.sleep(0)` duplicated in both branches. This\nshould be on common trunk.\n\n**Current structure:**\n```python\nif not readable:\n    if self.precommit_state.task.done():\n        return\n    await asyncio.sleep(0)\n    continue\nif not _read_chunk():\n    return\nawait asyncio.sleep(0)\n```\n\n**Simplified:**\n```python\nif not readable:\n    if self.precommit_state.task.done():\n        return\nelif not _read_chunk():\n    return\nawait asyncio.sleep(0)\n```\n\nThe sleep always happens unless we return early. Factor it to common trunk.\n',
  should_flag: true,
}
