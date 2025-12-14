{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/gepa/gepa_adapter.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/gepa/gepa_adapter.py': [
          {
            end_line: 373,
            start_line: 373,
          },
          {
            end_line: 394,
            start_line: 394,
          },
          {
            end_line: 406,
            start_line: 406,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The optimize_with_gepa function returns tuple[str, Any] where the second element\nis typed as Any. This should be replaced with a concrete type for the GEPA result,\nlikely the return type of gepa.optimize(). Using Any loses type safety and IDE support.\n',
  should_flag: true,
}
