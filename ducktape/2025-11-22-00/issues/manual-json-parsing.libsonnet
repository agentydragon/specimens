{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/policy_eval/runner.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/policy_eval/runner.py': [
          {
            end_line: 83,
            start_line: 76,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 80 does `json.loads(...)` to parse JSON, then passes the dict to `PolicyResponse.model_validate(data)`. Pydantic provides `model_validate_json()` which does both steps in one call and is more efficient.\n\n**Benefits of model_validate_json():**\n- Pydantic's JSON parser is faster (uses Rust)\n- Works directly on bytes (no decode needed for success case)\n- One-step parsing and validation\n- Better error messages from Pydantic\n\n**Correct approach:**\n\nUse `model_validate_json()` directly on bytes:\n```python\nlogs = container.logs(stdout=True, stderr=True) or b\"\"\nif status != 0:\n    text = logs.decode(\"utf-8\", errors=\"replace\")\n    raise RuntimeError(f\"policy eval failed (exit={status}): {text.strip()}\")\ntry:\n    return PolicyResponse.model_validate_json(logs.strip())\nexcept Exception as e:\n    text = logs.decode(\"utf-8\", errors=\"replace\")\n    raise RuntimeError(f\"invalid JSON from policy eval: {e}; output={text!r}\") from e\n```\n",
  should_flag: true,
}
