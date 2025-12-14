{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/profile/profile.go',
        ],
      ],
      files: {
        'internal/profile/profile.go': [
          {
            end_line: 17,
            start_line: 5,
          },
        ],
      },
      note: 'addr atomic.Value stored as `v`; prefer naming like storedAddr/address in accessors to avoid confusion.',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'internal/profile/server.go',
        ],
      ],
      files: {
        'internal/profile/server.go': [
          {
            end_line: 46,
            start_line: 33,
          },
        ],
      },
      note: 'v variable read from CRUSH_PROFILE is ambiguous; syscall/env var pstr should be named pprofPortStr or similar.',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'e2e/setup_helpers.go',
        ],
      ],
      files: {
        'e2e/setup_helpers.go': [
          {
            end_line: 76,
            start_line: 70,
          },
        ],
      },
      note: 'bool `b` used to set Wire.Compress; rename to compressEnabled to highlight units/purpose.',
      occurrence_id: 'occ-2',
    },
  ],
  rationale: 'Ambiguous or overly terse local/var names reduce readability. Prefer descriptive names that encode units/meaning (e.g., address/storedAddr, compressEnabled, CRUSH_PROFILE env var semantics).\n',
  should_flag: true,
}
