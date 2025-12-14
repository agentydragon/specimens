{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/message/message.go',
        ],
      ],
      files: {
        'internal/message/message.go': [
          {
            end_line: 406,
            start_line: 358,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The unmarshalling switch in internal/message/message.go repeats the same pattern for each part type: allocate typed var, json.Unmarshal(wrapper.Data, &var), check err, append. This is noisy and error-prone; centralize using a map of constructors/decoders to reduce duplication and make adding new part types simpler.',
  should_flag: true,
}
