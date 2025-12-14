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
            end_line: 86,
            start_line: 85,
          },
        ],
      },
      note: 'on_user_text_event: ut variable should be inlined',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 93,
            start_line: 92,
          },
        ],
      },
      note: 'on_tool_call_event: tc variable should be inlined',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 101,
            start_line: 100,
          },
        ],
      },
      note: 'on_tool_result_event: fco variable should be inlined',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Three event handler methods in `UiEventHandler` create trivial single-use variables that should be inlined directly into the function call:\n\n**Lines 85-86** (`on_user_text_event`): Variable `ut` is assigned `UiUserText(text=evt.text)` and immediately passed to `self._spawn(self._send_and_reduce(ut))`. Inline to: `self._spawn(self._send_and_reduce(UiUserText(text=evt.text)))`.\n\n**Lines 92-93** (`on_tool_call_event`): Variable `tc` is assigned `UiToolCall(name=evt.name, args_json=evt.args_json, call_id=evt.call_id)` and immediately passed to `self._spawn(self._send_and_reduce(tc))`. Inline to: `self._spawn(self._send_and_reduce(UiToolCall(name=evt.name, args_json=evt.args_json, call_id=evt.call_id)))`.\n\n**Lines 100-101** (`on_tool_result_event`): Variable `fco` is assigned `FunctionCallOutput(call_id=evt.call_id, result=evt.result)` and immediately passed to `self._spawn(self._send_and_reduce(fco))`. Inline to: `self._spawn(self._send_and_reduce(FunctionCallOutput(call_id=evt.call_id, result=evt.result)))`.\n\nThese single-use aliases add no clarity - the constructor calls are self-documenting. Inlining removes unnecessary intermediate variables without sacrificing readability.\n',
  should_flag: true,
}
