{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/constants.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/constants.py': [
          {
            end_line: 27,
            start_line: 18,
          },
        ],
      },
      note: 'First definition in shared constants',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/exec/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/exec/models.py': [
          {
            end_line: 19,
            start_line: 14,
          },
          {
            end_line: 57,
            start_line: 56,
          },
        ],
      },
      note: 'Duplicate definition in exec/models',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: 'Exit code constants (SIGNAL_EXIT_OFFSET, signal_exit_code(), EXIT_CODE_SIGTERM,\nEXIT_CODE_SIGKILL) are duplicated in both _shared/constants.py and exec/models.py\nwith identical definitions.\n\nThis creates a maintenance burden and risks divergence. Since these constants are\ntightly coupled to the exec implementation and primarily used there, they should\nbe defined in exec/models.py only.\n\nResolution: Remove the duplicates from _shared/constants.py and update\ncontainer_session.py to import from exec/models.py instead.\n',
  should_flag: true,
}
