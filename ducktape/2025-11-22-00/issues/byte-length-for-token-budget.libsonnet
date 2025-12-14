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
            end_line: 8,
            start_line: 8,
          },
          {
            end_line: 15,
            start_line: 14,
          },
          {
            end_line: 29,
            start_line: 18,
          },
          {
            end_line: 146,
            start_line: 146,
          },
          {
            end_line: 151,
            start_line: 151,
          },
          {
            end_line: 155,
            start_line: 155,
          },
          {
            end_line: 160,
            start_line: 160,
          },
          {
            end_line: 165,
            start_line: 163,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The code uses byte length (`_len_bytes()`) to cap context passed to LLMs,\nbut LLM token budgets are better approximated by character count, not bytes.\n\n**Current implementation:**\nByte-based logic with `_len_bytes()`, `MAX_PROMPT_CONTEXT_BYTES = 100 * 1024`,\nand byte-boundary truncation in `_cap_append()` (lines 14-29). Used to cap\nstatus, diff, and log output in `_build_ai_context()` (lines 141-166).\n\n**Problems:**\n1. **Wrong approximation**: LLM tokens correlate with character count, not bytes.\n   Multi-byte UTF-8 (emoji/CJK) are 3-4 bytes but typically 1 token, so byte-based\n   limits penalize non-ASCII content unnecessarily.\n2. **Arbitrary units**: \"100 KiB\" is meaningless for token budgets; should be\n   expressed as character count or approximate token count.\n3. **Byte-boundary truncation**: Can break mid-character in UTF-8 (code handles\n   with `errors=\"ignore\"` but adds complexity).\n4. **Complexity**: Encoding/decoding is more complex than using `len(s)`.\n\n**Correct approach:**\nUse character count directly. Express cap as `MAX_PROMPT_CONTEXT_CHARS = 100_000`\n(~25k tokens at ~4 chars/token). Truncate via string slicing, which always\nproduces valid strings.\n\n**Benefits:**\n1. Better approximation: Chars correlate with tokens better than bytes\n2. Clearer intent: \"100k chars\" is more meaningful than \"100 KiB\"\n3. Simpler code: No encoding/decoding, just string slicing\n4. No mid-character breaks: String slicing always produces valid strings\n5. Portable: Byte lengths vary by encoding; char counts don't\n\n**Note:** For precise token counting, use a tokenizer (e.g., `tiktoken`). For\nrough caps, character count is a better heuristic than byte length.\n",
  should_flag: true,
}
