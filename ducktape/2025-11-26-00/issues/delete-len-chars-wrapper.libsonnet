{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/core.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/core.py': [
          {
            end_line: 15,
            start_line: 14,
          },
          {
            end_line: null,
            start_line: 20,
          },
          {
            end_line: null,
            start_line: 21,
          },
          {
            end_line: null,
            start_line: 152,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 14-15 define `_len_chars(s: str) -> int` which just returns `len(s)`. This\nis a trivial wrapper that should be deleted.\n\n**Current:**\n```python\ndef _len_chars(s: str) -> int:\n    return len(s)\n\n# Used at:\ncurrent_chars = sum(_len_chars(p) for p in parts)  # line 20\nneeded_chars = _len_chars(chunk)  # line 21\nif _len_chars(out) > MAX_PROMPT_CONTEXT_CHARS:  # line 152\n```\n\n**Fix:**\n- Delete lines 14-15\n- Line 20: Use `len(p)` instead of `_len_chars(p)`\n- Line 21: Use `len(chunk)` instead of `_len_chars(chunk)`\n- Line 152: Use `len(out)` instead of `_len_chars(out)`\n\n**Benefits:**\n1. Fewer functions\n2. Uses standard library directly\n3. No indirection\n\n**Note:** This function was likely created thinking strings might be measured differently\nthan their length, but Python's `len()` on strings returns character count, which is\nwhat we want.\n",
  should_flag: true,
}
