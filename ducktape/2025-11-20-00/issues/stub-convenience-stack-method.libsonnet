{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/infrastructure.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/infrastructure.py': [
          {
            end_line: 182,
            start_line: 180,
          },
        ],
      },
      note: 'PolicyReaderStub creation boilerplate',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/infrastructure.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/infrastructure.py': [
          {
            end_line: 186,
            start_line: 184,
          },
        ],
      },
      note: 'PolicyApproverStub creation boilerplate',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: "Creating typed server stubs requires verbose boilerplate (infrastructure.py:180-186):\n\nreader_client = Client(reader_server)\nawait stack.enter_async_context(reader_client)\npolicy_reader = PolicyReaderStub(TypedClient(reader_client))\n\napprover_client = Client(approver_server)\nawait stack.enter_async_context(approver_client)\npolicy_approver = PolicyApproverStub(TypedClient(approver_client))\n\nThis 3-line pattern repeats for every stub. Should provide convenience method:\n\npolicy_reader = await PolicyReaderStub.for_server(stack, reader_server)\npolicy_approver = await PolicyApproverStub.for_server(stack, approver_server)\n\nOr even simpler with context manager protocol on stub class.\n\nThe for_server method would encapsulate:\n1. Create Client from server\n2. Enter into async context stack\n3. Wrap in TypedClient\n4. Return stub instance\n\nBenefits:\n- DRY: pattern in one place\n- Less error-prone: can't forget context manager entry\n- Clearer intent: \"create stub from server\"\n- Reduces line count 3:1\n\nThis suggests base class method or helper function in server stub framework.\n",
  should_flag: true,
}
