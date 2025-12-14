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
            end_line: 536,
            start_line: 532,
          },
          {
            end_line: null,
            start_line: 728,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 532-536 define `_stage_all_if_requested()` which takes a boolean and is\na no-op if the boolean is False. This is an antipattern.\n\n**Current:**\n```python\ndef _stage_all_if_requested(repo: pygit2.Repository, include_all: bool) -> None:\n    if include_all:\n        # Stage tracked changes (approximate 'git add -u')\n        repo.index.add_all()\n        repo.index.write()\n\n# Later at line 728:\n_stage_all_if_requested(repo, include_all)\n```\n\n**Why this is an antipattern:**\n1. Function exists only to wrap an if-statement\n2. Caller already has the boolean condition\n3. Adds indirection for no benefit\n4. Function name encodes the condition (\"if_requested\")\n\n**Fix:** Inline at call site (line 728):\n```python\nif args.stage_all:\n    repo.index.add_all()\n    repo.index.write()\n```\n\nDelete the function definition (lines 532-536).\n\n**Benefits:**\n1. Fewer functions to track\n2. Control flow is explicit at call site\n3. No need to pass boolean parameter\n",
  should_flag: true,
}
