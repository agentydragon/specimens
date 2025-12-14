{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/container_session.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/container_session.py': [
          {
            end_line: 132,
            start_line: 132,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 132 has a useless comment \"# Apply network mode if not 'none'\" that merely restates what the immediately following code does, without adding any useful context or explanation.\n\n**Current code:**\n```python\n# Apply network mode if not 'none'\nif opts.network_mode != \"none\":\n    host_config[\"NetworkMode\"] = opts.network_mode\n```\n\n**Why this comment is useless:**\n- The comment literally restates the condition (\"if not 'none'\") visible in the code\n- It doesn't explain WHY we guard against \"none\" (which is actually questionable - see related issue about unnecessary guards)\n- It doesn't provide context that isn't immediately obvious from reading the code\n- \"Apply network mode\" is self-evident from the assignment statement\n\n**Good comments explain WHY, not WHAT:**\n- A useful comment would explain the reasoning: \"Docker requires explicit NetworkMode setting even for 'none'\"\n- Or document a gotcha: \"Setting NetworkMode='none' causes issue X, so we omit it\"\n- But this comment just narrates the code\n\n**Fix:**\nRemove the comment entirely. If the guard is kept (though it shouldn't be - see related issue), the code is self-documenting. If there IS a reason for the guard, document that reason instead.\n\n**Related issues:**\n- The guard `if opts.network_mode != \"none\"` is itself unnecessary (see separate issue about unnecessary guards in _build_host_config)\n",
  should_flag: true,
}
