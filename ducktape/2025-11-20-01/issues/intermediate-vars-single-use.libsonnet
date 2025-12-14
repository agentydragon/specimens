{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_loop_reducer_skip_sampling.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_loop_reducer_skip_sampling.py': [
          {
            end_line: 31,
            start_line: 24,
          },
          {
            end_line: 45,
            start_line: 38,
          },
        ],
      },
      note: 'dec = ctrl.on_before_sample() then assert on dec; two instances',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_aggregating_inserts.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_aggregating_inserts.py': [
          {
            end_line: 42,
            start_line: 35,
          },
        ],
      },
      note: 'dec = ctrl.on_before_sample() then assert on dec',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_exec_roundtrip.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_exec_roundtrip.py': [
          {
            end_line: 32,
            start_line: 24,
          },
        ],
      },
      note: 'res = await stub(ExecInput(...)) then assert on res',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'adgn/tests/agent/test_editor_inproc.py',
        ],
      ],
      files: {
        'adgn/tests/agent/test_editor_inproc.py': [
          {
            end_line: 30,
            start_line: 29,
          },
        ],
      },
      note: 'done_result = await stub.done(...) then assert on done_result',
      occurrence_id: 'occ-3',
    },
  ],
  rationale: 'Test files extract values into variables and then immediately use them once\nin an assertion. These should be inlined directly into the assertion.\n\n**Why inline?**\n- Variables are used exactly once, immediately after definition\n- No clarifying benefit from variable name (dec, res vs the call itself)\n- Less code to read and maintain\n- Standard pattern: only extract to variable if used multiple times, adds\n  semantic clarity, or expression is very complex\n',
  should_flag: true,
}
