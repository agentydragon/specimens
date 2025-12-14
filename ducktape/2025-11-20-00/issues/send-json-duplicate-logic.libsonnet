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
            end_line: 128,
            start_line: 119,
          },
          {
            end_line: 196,
            start_line: 187,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'send_json and _send_direct_all have identical logic except for how they send\n(runtime.py:119-128, 187-196).\n\nsend_json uses q.put_nowait():\nfor _ws, q, _task in list(self._clients.values()):\n    q.put_nowait(dumped)\n\n_send_direct_all uses ws.send_json():\nfor ws, _q, _task in list(self._clients.values()):\n    await ws.send_json(dumped)\n\nBoth:\n1. Create identical Envelope with same fields\n2. Call model_dump(mode="json")\n3. Iterate over self._clients.values()\n4. Send to each client\n\nOnly difference: synchronous put_nowait vs async send_json.\n\nShould extract common logic:\ndef _create_envelope(self, payload: ServerMessage) -> dict:\n    return Envelope(\n        session_id=self._session_id,\n        event_id=self._next_event_id(),\n        event_at=datetime.now(UTC),\n        payload=payload,\n    ).model_dump(mode="json")\n\nasync def send_json(self, payload: ServerMessage) -> None:\n    dumped = self._create_envelope(payload)\n    for _ws, q, _task in list(self._clients.values()):\n        q.put_nowait(dumped)\n\nasync def _send_direct_all(self, payload: ServerMessage) -> None:\n    dumped = self._create_envelope(payload)\n    for ws, _q, _task in list(self._clients.values()):\n        await ws.send_json(dumped)\n\nOr unify completely if possible.\n\nBenefits:\n- DRY: envelope creation in one place\n- Easier to maintain: change once, affects both\n- Clear separation: envelope creation vs distribution\n',
  should_flag: true,
}
