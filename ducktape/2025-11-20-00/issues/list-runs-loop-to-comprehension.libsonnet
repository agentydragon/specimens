{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/sqlite.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/sqlite.py': [
          {
            end_line: 417,
            start_line: 403,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'list_runs uses imperative loop-and-append pattern (sqlite.py:403-417):\n\nout: list[RunRow] = []\nfor run in runs:\n    out.append(RunRow(...))\nreturn out\n\nShould use list comprehension:\nreturn [\n    RunRow(\n        id=UUID(run.id),\n        agent_id=AgentID(run.agent_id),\n        ...\n    )\n    for run in runs\n]\n\nBenefits:\n- More Pythonic and concise\n- Clearer intent: transforming collection\n- Slightly more efficient (no append overhead)\n- Removes intermediate variable\n\nLoop-and-append is imperative style; list comprehension is functional/declarative.\n',
  should_flag: true,
}
