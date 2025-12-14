{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/state.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/state.py': [
          {
            end_line: 115,
            start_line: 110,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 110-115 define `_find_last_tool_index()` which manually iterates backwards using\n`range(len(state.items) - 1, -1, -1)` and a separate line to extract each item. This\nis verbose and error-prone.\n\n**Problems:**\nManual index arithmetic (`len(...) - 1, -1, -1`) is verbose. Separate item access\n(`it = state.items[idx]`) adds an extra line. This pattern has a standard Python idiom:\n`reversed(enumerate(...))`.\n\n**Fix:** Use `for idx, it in reversed(list(enumerate(state.items)))`. This makes intent\nexplicit (\"iterate backwards over indexed items\"), eliminates manual arithmetic, and\ncombines index+item access in one line.\n\nNote: wrap `enumerate(...)` in `list()` before `reversed()` because enumerate returns\nan iterator that doesn't support reverse iteration directly.\n",
  should_flag: true,
}
