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
            end_line: 20,
            start_line: 19,
          },
          {
            end_line: null,
            start_line: 41,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 19-20 define a trivial function `_safe_root()` that just returns\n`Path.cwd().resolve()`:\n\ndef _safe_root() -> Path:\n    return Path.cwd().resolve()\n\nThis function has only one call site (line 41: `root = _safe_root()`) and\nprovides no meaningful abstraction. The function name doesn't add clarity\nbeyond what the method chain already conveys.\n\nThe function should be removed and its body inlined at the call site:\n\nroot = Path.cwd().resolve()\n\nThis reduces indirection without losing any clarity or functionality.\nSingle-use trivial wrappers like this add maintenance cost (another\ndefinition to read/understand) without providing benefit (no reuse, no\ncomplex logic being named, no testability improvement).\n",
  should_flag: true,
}
