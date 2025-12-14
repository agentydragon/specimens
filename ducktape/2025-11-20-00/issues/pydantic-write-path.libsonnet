{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/handler.py': [
          {
            end_line: 103,
            start_line: 102,
          },
          {
            end_line: null,
            start_line: 110,
          },
          {
            end_line: 146,
            start_line: 145,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Pre-serialization of Pydantic models before passing to persistence layer.\n\nCalls model_dump() at caller site (lines 102-103, 110, 145-146) before passing\nto persistence methods. This violates separation of concerns - caller shouldn't\nknow about persistence format.\n\nAnti-pattern: Serialization at caller site instead of callee. Correct approach:\nappend_event should accept typed EventRecord payload, ResponsePayload should\naccept Response model, and serialization should happen inside persistence layer.\n\nBenefits:\n- Type safety preserved across call boundary\n- Single serialization point (DRY)\n- Clearer responsibility boundaries\n- Caller doesn't need to know persistence format\n- Easier to change serialization strategy later\n",
  should_flag: true,
}
