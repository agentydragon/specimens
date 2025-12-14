{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/tools/arg0_runner.py',
        ],
      ],
      files: {
        'adgn/src/adgn/tools/arg0_runner.py': [
          {
            end_line: 31,
            start_line: 25,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 25-31 in arg0_runner.py include a try/except AttributeError guard for\nPython versions older than 3.11:\n\ntry:\n    # Python 3.11+: use is_relative_to for robust ancestor check\n    if not p.is_relative_to(root):\n        raise ValueError\nexcept AttributeError:  # pragma: no cover - fallback for older Pythons\n    if str(p).startswith(str(root)) is False:\n        raise ValueError\n\nHowever, the project's pyproject.toml requires Python >=3.12:\n\nrequires-python = \">=3.12,<3.14\"\n\nThe `is_relative_to()` method was added in Python 3.9, so this compatibility\nguard is completely unnecessary. The code can never run on a Python version\nthat lacks this method.\n\nThe guard should be removed, leaving only:\n\nif not p.is_relative_to(root):\n    raise ValueError\n\nUnnecessary compatibility guards add complexity and mislead readers about\nthe supported Python versions. When the minimum Python version is clearly\nspecified in pyproject.toml, the code should assume that version's features\nare available.\n",
  should_flag: true,
}
