{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/policy_eval/container.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/policy_eval/container.py': [
          {
            end_line: 46,
            start_line: 17,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Class (container.py:17-46) uses manual `__init__` for simple field\ninitialization. The constructor does assignment-only initialization\nwith no complex logic, perfect candidate for `@dataclass`.\n\nBenefits of dataclass: less boilerplate (no manual assignments), free\n`__repr__` for debugging, free `__eq__` for testing, type annotations\nserve as field declarations, standard Python idiom for data-holding\nclasses. Use `__post_init__` if complex initialization needed.\n',
  should_flag: true,
}
