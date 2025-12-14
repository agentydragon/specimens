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
            end_line: 33,
            start_line: 26,
          },
          {
            end_line: 43,
            start_line: 36,
          },
          {
            end_line: 53,
            start_line: 46,
          },
          {
            end_line: 93,
            start_line: 93,
          },
          {
            end_line: 182,
            start_line: 172,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'model.py input message types (AssistantMessage, UserMessage, SystemMessage lines\n26-53) embed the discriminator field (role) directly in the message class,\nmixing API-level concerns with content structure.\n\nCurrent inconsistency: input messages use "role" as discriminator, other input\nitems use "type" (ReasoningItem, FunctionCallItem), output messages use "kind"\n(AssistantMessageOut line 172-182). This creates three different discriminator\nnaming conventions.\n\nSeparate message from discriminator using wrapper pattern: message class contains\ncontent only, wrapper class contains discriminator "kind" plus message. This\nmatches the output pattern (AssistantMessageOut) and enables clearer type\ndiscrimination for union types (InputItem line 93).\n\nBenefits: Consistent discriminator naming, separates transport/API concerns from\ncontent structure, message content can evolve independently from serialization\nformat.\n',
  should_flag: true,
}
