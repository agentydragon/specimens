{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/notifications/buffer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/notifications/buffer.py': [
          {
            end_line: 41,
            start_line: 40,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The class uses sets (`_updates`, `_list_changed`) during accumulation, then converts\nto frozen structures in NotificationsBatch. This is clunky.\n\n**Current pattern:**\n```python\n# Accumulation storage (mutable sets)\nself._updates: dict[str, set[str]] = {}\nself._list_changed: set[str] = set()\n\n# On add:\nself._updates[server_name].add(uri)\nself._list_changed.add(server_name)\n\n# On poll/peek:\nresources = self._build_resources()  # Converts sets to frozen structures\nreturn NotificationsBatch(resources=resources)\n```\n\n**Problem:** Clunky conversion between mutable sets and immutable structures.\n\n**Better approach:**\nReplace `dict[str, set[str]]` and `set[str]` with a single mutable `NotificationsBatch`\ninstance (`self._batch`). On add operations, mutate `_batch` directly. On poll, return\n`self._batch.model_copy()` and reset `_batch = NotificationsBatch()`. On peek, return\n`self._batch.model_copy()`. This eliminates the conversion logic between sets and frozen\nstructures.\n\n**Benefits:**\n1. Simpler - one data structure instead of two representations\n2. No conversion logic needed\n3. More elegant and DRY\n4. Clearer what's being accumulated\n",
  should_flag: true,
}
