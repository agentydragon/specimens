{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/container_session.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/container_session.py': [
          {
            end_line: null,
            start_line: 60,
          },
        ],
      },
      note: 'Field definition in ContainerOptions dataclass',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/exec/docker/launcher.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/exec/docker/launcher.py': [
          {
            end_line: null,
            start_line: 63,
          },
          {
            end_line: null,
            start_line: 94,
          },
        ],
      },
      note: 'CLI argument definition and usage in launcher',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: "The `describe` field in ContainerOptions and the `--describe` CLI argument are defined but never used. The field is set from the CLI argument in launcher.py (line 94), but the value is never checked or referenced anywhere in the codebase. Image history is unconditionally fetched in container_session.py (line 393) regardless of this flag's value, making the entire field and its CLI argument dead code.\n",
  should_flag: true,
}
