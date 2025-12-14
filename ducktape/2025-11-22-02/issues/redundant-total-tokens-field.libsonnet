{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/handler.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/handler.py': [
          {
            end_line: null,
            start_line: 29,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The TokenUsage model has a total_tokens field that is a trivial sum of two other fields:\n\nclass TokenUsage(BaseModel):\n    input_tokens: int | None = Field(None, ...)\n    output_tokens: int | None = Field(None, ...)\n    total_tokens: int | None = Field(None, description=\"Total tokens consumed (input + output)\")\n\nThe total_tokens field is redundant:\n- It's always input_tokens + output_tokens\n- No additional information\n- Must be kept in sync manually (error-prone)\n- Wastes storage/bandwidth\n\nThis violates DRY - the total is trivially computable from the parts.\n\nFix options:\n1. Preferred: Remove total_tokens field entirely. Callers compute:\n   total = (usage.input_tokens or 0) + (usage.output_tokens or 0)\n\n2. For API compatibility, make it a computed property:\n   @property\n   def total_tokens(self) -> int | None:\n       if self.input_tokens is None and self.output_tokens is None:\n           return None\n       return (self.input_tokens or 0) + (self.output_tokens or 0)\n\nThis ensures:\n- Single source of truth (input + output)\n- Cannot get out of sync\n- No redundant storage\n- Backward compatible if needed\n",
  should_flag: true,
}
