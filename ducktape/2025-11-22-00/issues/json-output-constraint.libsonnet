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
            end_line: 80,
            start_line: 80,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 80 uses `.strip().splitlines()[-1]` to extract the last line, which unnecessarily constrains the policy output to not contain newlines in the JSON. Valid JSON can span multiple lines.\n\n**Current implementation assumes:**\n- Policy output is line-based\n- JSON response is on the last line\n- JSON can't contain newlines\n\n**Why this is problematic:**\n\nValid pretty-printed JSON output would break:\n```json\n{\n  \"decision\": \"allow\",\n  \"rationale\": \"Looks good\"\n}\n```\nGets parsed as: `json.loads('\"rationale\": \"Looks good\"\\n}')` → Error!\n\n**Correct approach:**\n\nParse the entire output directly (ideally policy should output ONLY JSON, not mix debug output and JSON. If debug output is needed, send it to stderr, not stdout):\n\n```python\ntry:\n    return PolicyResponse.model_validate_json(logs.strip())\nexcept Exception as e:\n    text = logs.decode(\"utf-8\", errors=\"replace\")\n    raise RuntimeError(f\"invalid JSON from policy eval: {e}; output={text!r}\") from e\n```\n",
  should_flag: true,
}
