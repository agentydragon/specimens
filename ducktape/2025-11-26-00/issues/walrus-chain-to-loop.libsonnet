{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 695,
            start_line: 687,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 687-695 use a chain of walrus operators to check editor candidates. This\nshould be refactored into a for-loop for better readability.\n\n**Current:**\n```python\nif editor := os.environ.get(\"GIT_EDITOR\"):\n    return editor\nif editor := repo.config.get(\"core.editor\"):\n    return editor\nif editor := os.environ.get(\"VISUAL\"):\n    return editor\nif editor := os.environ.get(\"EDITOR\"):\n    return editor\nreturn \"vi\"\n```\n\n**Refactored:**\n```python\nfor candidate in (\n    os.environ.get(\"GIT_EDITOR\"),\n    repo.config.get(\"core.editor\"),\n    os.environ.get(\"VISUAL\"),\n    os.environ.get(\"EDITOR\"),\n    \"vi\",\n):\n    if candidate:\n        return candidate\n```\n\n**Benefits:**\n1. DRY - no repeated `if editor := ... return editor` pattern\n2. Clear that we're checking candidates in order\n3. Easier to reorder or add/remove candidates\n4. `\"vi\"` is now part of the candidate list, not special-cased\n\n**Note:** The loop naturally handles None values (they're falsy and skipped).\nThe final \"vi\" is always truthy so the function always returns.\n",
  should_flag: true,
}
