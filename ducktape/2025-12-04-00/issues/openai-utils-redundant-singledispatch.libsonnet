{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/openai_utils/model.py',
        ],
      ],
      files: {
        'adgn/src/adgn/openai_utils/model.py': [
          {
            end_line: 273,
            start_line: 261,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 261-273 contain three redundant `@singledispatch` registered functions that are identical - they all just return `item` unchanged with the same comment \"No conversion needed, X is already an InputItem\".\n\nCurrent pattern (duplicated 3 times):\n```python\n@response_out_item_to_input.register\ndef _(item: ReasoningItem) -> InputItem:\n    return item  # No conversion needed, ReasoningItem is already an InputItem\n\n@response_out_item_to_input.register\ndef _(item: FunctionCallItem) -> InputItem:\n    return item  # No conversion needed, FunctionCallItem is already an InputItem\n\n@response_out_item_to_input.register\ndef _(item: FunctionCallOutputItem) -> InputItem:\n    return item  # No conversion needed, FunctionCallOutputItem is already an InputItem\n```\n\nWhile `@singledispatch.register` doesn't support Union types like `item: (ReasoningItem | FunctionCallItem | ...)`, you CAN register the same function for multiple types to avoid duplication:\n\n```python\ndef _identity(item: InputItem) -> InputItem:\n    return item\n\nresponse_out_item_to_input.register(ReasoningItem)(_identity)\nresponse_out_item_to_input.register(FunctionCallItem)(_identity)\nresponse_out_item_to_input.register(FunctionCallOutputItem)(_identity)\n```\n\nOr in a loop:\n```python\n_identity_types = [ReasoningItem, FunctionCallItem, FunctionCallOutputItem]\nfor typ in _identity_types:\n    response_out_item_to_input.register(typ)(lambda item: item)\n```\n\nThis eliminates the redundant function definitions while maintaining the same dispatch behavior.\n",
  should_flag: true,
}
