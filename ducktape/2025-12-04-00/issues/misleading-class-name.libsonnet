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
            end_line: null,
            start_line: 38,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Class named ConnectionManager but extends BaseHandler and primarily handles agent events, not connections. The name obscures its role as an event handler, making the architecture harder to understand when skimming code.\n\nThe class manages message delivery and event handling for the agent session, not connection lifecycle. A name like MessageDeliveryHandler or UiEventHandler would better reflect its actual purpose.\n',
  should_flag: true,
}
