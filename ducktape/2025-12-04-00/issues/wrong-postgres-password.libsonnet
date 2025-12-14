{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/.envrc',
          'adgn/devenv.nix',
        ],
      ],
      files: {
        'adgn/.envrc': [
          {
            end_line: 33,
            start_line: 28,
          },
        ],
        'adgn/devenv.nix': [
          {
            end_line: null,
            start_line: 40,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The .envrc file exports database URLs with hardcoded password `postgres` (lines 28 and 33), but the actual PostgreSQL container (defined in devenv.nix line 40) uses password `props_admin_pass`. This password mismatch breaks database access when code attempts to connect using the environment variables.\n',
  should_flag: true,
}
