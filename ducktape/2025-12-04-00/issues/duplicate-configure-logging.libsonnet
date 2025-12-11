local I = import 'lib.libsonnet';

I.issueMulti(
  rationale=|||
    The function `_configure_logging_info` is duplicated in two files. While slightly different in implementation (cli.py has a longer version that also sets handler level to INFO, matrix_bot.py just calls configure_logging), they serve the same purpose: configure INFO-level logging before running commands.

    The cli.py version (lines 91-96) explicitly sets StreamHandler level to INFO after calling configure_logging. The matrix_bot.py version (lines 35-36) just calls configure_logging.

    These should be unified into a single shared implementation, likely in a common logging configuration module.
  |||,
  occurrences=[
    {
      files: {
        'adgn/src/adgn/agent/cli.py': [[91, 96]],
      },
      note: 'Full implementation with StreamHandler level setting',
      expect_caught_from: [['adgn/src/adgn/agent/cli.py']],
    },
    {
      files: {
        'adgn/src/adgn/agent/matrix_bot.py': [[35, 36]],
      },
      note: 'Simpler implementation just calling configure_logging',
      expect_caught_from: [['adgn/src/adgn/agent/matrix_bot.py']],
    },
  ]
)
