{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/__init__.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/__init__.py': [
          {
            end_line: 130,
            start_line: 130,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Line 130 imports `from .events import EventRecord, TypedPayload  # noqa: E402`, using\n`# noqa: E402` to suppress "module level import not at top of file" linting error.\n\nProblems: (1) Suppresses legitimate linting error - real code smell should be fixed, not\nsuppressed. (2) Violates PEP 8 - imports should be at top after module docstring.\n(3) Hides potential circular import - `noqa` suggests circular dependency being papered\nover. (4) Inconsistent with rest of file - all other imports (lines 1-10) are at top.\n(5) Scattered imports make dependencies hard to see at a glance.\n\nRecommended approaches: (1) If circular import, refactor - move EventRecord/TypedPayload\nto separate `types.py`, have both `__init__.py` and `events.py` import from it.\n(2) If no circular dependency, move import to top. (3) If TYPE_CHECKING needed for forward\nrefs, use `if TYPE_CHECKING:` block at top.\n\nCheck if circular import actually exists by trying to move import to top. If fails,\nrefactor module structure to break cycle rather than suppressing warning.\n',
  should_flag: true,
}
