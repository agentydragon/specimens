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
            end_line: 330,
            start_line: 319,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `_stream_output` function (cli.py lines 319-330) contains two nearly-identical\n`select-read-sleep` loops differing only in termination condition.\n\nFirst loop: reads while task not done. Second loop: drains remaining data (while True).\nBoth use identical `select.select([master_fd], [], [], 0.01)`, check `readable`,\ncall `_read_chunk()`, and `await asyncio.sleep(0)`.\n\n**Problems:**\n- Code duplication (pattern repeated with minimal variation)\n- Bug fixes must be applied twice\n- Hard to see what actually differs between loops\n- Missing abstraction opportunity\n\n**Fix:** Extract helper accepting condition parameter (e.g., `_read_until(master_fd,\nread_chunk, should_continue)`), or unify into single loop with conditional\ntermination. Benefits: DRY, clearer intent, single maintenance point, testable\nindependently.\n',
  should_flag: true,
}
