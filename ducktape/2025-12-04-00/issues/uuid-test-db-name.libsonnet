{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/props/conftest.py',
        ],
      ],
      files: {
        'adgn/tests/props/conftest.py': [
          {
            end_line: 233,
            start_line: 232,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 232 uses uuid4() for test database names. The issue suggests using actual test IDs if available\nfrom pytest (e.g., request.node.nodeid) and applying a whitelist-based sanitizer (keep alphanumeric/underscore,\nreject special chars) instead of just replacing hyphens. The length limit could also be increased to something\nmore reasonable like 128 characters if PostgreSQL allows it.\n',
  should_flag: true,
}
