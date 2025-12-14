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
            end_line: 203,
            start_line: 197,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "_pending_notifier accepts three primitive parameters and reconstructs ToolCall\n(infrastructure.py:197-200):\n\nasync def _pending_notifier(call_id: str, tool_key: str, args_json: str | None) -> None:\n    ...\n    tool_call = ToolCall(name=tool_key, call_id=call_id, args_json=args_json)\n    await self._connection_manager.send_payload(...)\n\nThe notifier immediately reconstructs the ToolCall object from its parts.\nThe caller must have had a ToolCall to decompose into these parameters.\n\nShould accept ToolCall directly:\nasync def _pending_notifier(tool_call: ToolCall) -> None:\n    ...\n    await self._connection_manager.send_payload(\n        ApprovalPendingEvt(approval=ApprovalBrief(tool_call=tool_call))\n    )\n\nBenefits:\n- Simpler interface: one parameter instead of three\n- Type safety: caller can't mix up parameter order\n- No decompose-then-reconstruct\n- Clearer contract: \"notify about this tool call\"\n\nThe current signature suggests legacy from when ToolCall didn't exist as a type.\n",
  should_flag: true,
}
