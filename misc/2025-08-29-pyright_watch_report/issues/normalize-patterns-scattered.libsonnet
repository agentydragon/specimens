{
  occurrences: [
    {
      expect_caught_from: [
        [
          'pyright_watch_report.py',
        ],
      ],
      files: {
        'pyright_watch_report.py': [
          {
            end_line: null,
            start_line: 65,
          },
          {
            end_line: null,
            start_line: 70,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Specimen has many scattered calls to `normalize_pattern`; internal variables are a mix of normalized/un-normalized patterns:\n\nOriginal (normalizes per call inside matcher):\n```python\ndef matches_any(path_rel: str, patterns: Iterable[str]) -> bool:\n  return any(\n      fnmatch.fnmatch(path_rel, normalize_pattern(p))\n      or fnmatch.fnmatch(\"/\" + path_rel, normalize_pattern(p))\n      for p in patterns\n  )\n```\n\nAvoid calling `normalize_pattern` in every match - this scatters the responsibility for \"patterns should be normalized\" all over the code.\nInstead, pass input un-normalized patterns (both include/exclude) *exactly once* through a normalization boundary, and after it, consistently deal only with normalized patterns:\n\nBetter (normalize once; matcher assumes normalized):\n```python\ninclude = expand_include_patterns(include)  # returns normalized\nexclude = [normalize_pattern(p) for p in exclude]\ndef matches_any(path_rel: str, patterns: Iterable[str]) -> bool:\n  return any(\n      fnmatch.fnmatch(path_rel, p) or fnmatch.fnmatch(\"/\" + path_rel, p)\n      for p in patterns\n  )\n```\n\nSupplemental: Options for adding more clarity which code assumes normalized / un-normalized patterns:\n* Document normalization requirements/contracts in docstrings/comments\n* Name variable hints, e.g. 'xyzzy_normalized` prefix/suffix\n* Marker type like `NormalizedPattern = NewType(\"NormalizedPattern\", str)`\n",
  should_flag: true,
}
