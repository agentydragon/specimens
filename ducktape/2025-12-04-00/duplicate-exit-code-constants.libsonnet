local I = import '../../lib.libsonnet';

I.issueMulti(
  rationale=|||
    Exit code constants (SIGNAL_EXIT_OFFSET, signal_exit_code(), EXIT_CODE_SIGTERM,
    EXIT_CODE_SIGKILL) are duplicated in both _shared/constants.py and exec/models.py
    with identical definitions.

    This creates a maintenance burden and risks divergence. Since these constants are
    tightly coupled to the exec implementation and primarily used there, they should
    be defined in exec/models.py only.

    Resolution: Remove the duplicates from _shared/constants.py and update
    container_session.py to import from exec/models.py instead.
  |||,
  occurrences=[
    {
      files: {
        'adgn/src/adgn/mcp/_shared/constants.py': [[18, 27]],
      },
      note: 'First definition in shared constants',
      expect_caught_from: [['adgn/src/adgn/mcp/_shared/constants.py']],
    },
    {
      files: {
        'adgn/src/adgn/mcp/exec/models.py': [[14, 19], [56, 57]],
      },
      note: 'Duplicate definition in exec/models',
      expect_caught_from: [['adgn/src/adgn/mcp/exec/models.py']],
    },
  ],
)
