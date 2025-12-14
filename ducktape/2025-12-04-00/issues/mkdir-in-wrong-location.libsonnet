{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/transcript_handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/transcript_handler.py': [
          {
            end_line: 37,
            start_line: 36,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 36-37 in transcript_handler.py create the parent directory in `__init__`, which performs I/O\nduring object construction. The comment on line 36 ("Create parent directory if needed") and the mkdir\noperation should be moved to `_write_event()` where the file is actually written. This follows the\nprinciple of lazy initialization and reduces work done during object construction. The mkdir call can\nbe performed once before the first write operation.\n',
  should_flag: true,
}
