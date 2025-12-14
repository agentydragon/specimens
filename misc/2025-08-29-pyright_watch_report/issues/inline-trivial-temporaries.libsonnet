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
            end_line: 279,
            start_line: 272,
          },
          {
            end_line: 139,
            start_line: 135,
          },
          {
            end_line: 158,
            start_line: 151,
          },
          {
            end_line: 231,
            start_line: 228,
          },
          {
            end_line: 251,
            start_line: 246,
          },
          {
            end_line: 256,
            start_line: 253,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Multiple trivial temporary variables should be inlined where they're used. Variables are\nassigned once and immediately passed on without additional logic, hurting readability.\n\n**Examples:**\n- Lines 272-279: `incl_stats` assigned from `sorted(...)`, used once in for loop — inline sorted() in the for statement\n- Lines 135-139: `exclude_impact` assigned sorted slice, used once — inline `sorted(...)[20]` in for\n- Lines 151-158: `total_files = len(kept_union)` used once in print — inline `len(kept_union)` in f-string\n- Lines 228-231: `dp = Path(dirpath)` used once as `dp / fn` — inline to `Path(dirpath) / fn`\n- Lines 246-251: `matched_any_excl = bool(hits)` used once in if — use `if hits:` directly\n\n**Fix:** Remove intermediate variables and inline expressions at their single use sites.\nThis follows the principle: avoid assigning to a variable if the only thing you do with\nit is immediately pass it on.\n",
  should_flag: true,
}
