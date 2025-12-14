{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/calltool.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/calltool.py': [
          {
            end_line: 70,
            start_line: 61,
          },
        ],
      },
      note: 'Docstring restates parameter names/types from signature; Returns section just says "instance of output_type"',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/transcript_handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/transcript_handler.py': [
          {
            end_line: 32,
            start_line: 22,
          },
        ],
      },
      note: 'TranscriptHandler docstring uses weasel word "Unified" and includes obvious usage snippet (lines 29-31)',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/resources.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/resources.py': [
          {
            end_line: 75,
            start_line: 61,
          },
        ],
      },
      note: 'Docstring includes unnecessary implementation detail (lines 63-64) and restates Args/Returns from signature',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/bootstrap.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/bootstrap.py': [
          {
            end_line: 185,
            start_line: 177,
          },
        ],
      },
      note: 'read_resource_call docstring Args/Returns sections restate parameter types and return type',
      occurrence_id: 'occ-3',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/bootstrap.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/bootstrap.py': [
          {
            end_line: 204,
            start_line: 196,
          },
        ],
      },
      note: 'docker_exec_call docstring Args/Returns sections restate parameter types and return type',
      occurrence_id: 'occ-4',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/grader/grader.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/grader/grader.py': [
          {
            end_line: 305,
            start_line: 294,
          },
        ],
      },
      note: 'grade_critique_by_id docstring restates obvious parameter info; only client and session docs add value',
      occurrence_id: 'occ-5',
    },
  ],
  rationale: 'Docstrings that are unnecessarily verbose and repeat information already clear from signatures, type hints, or context. Concise docstrings should focus on non-obvious behavior, not restate obvious facts.\n',
  should_flag: true,
}
