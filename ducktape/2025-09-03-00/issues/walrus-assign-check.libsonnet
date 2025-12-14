{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: 429,
            start_line: 421,
          },
          {
            end_line: 451,
            start_line: 448,
          },
          {
            end_line: 606,
            start_line: 599,
          },
          {
            end_line: 739,
            start_line: 731,
          },
          {
            end_line: 902,
            start_line: 894,
          },
          {
            end_line: 933,
            start_line: 927,
          },
          {
            end_line: 976,
            start_line: 969,
          },
          {
            end_line: 1052,
            start_line: 1044,
          },
          {
            end_line: 1154,
            start_line: 1149,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Multiple locations use assign-then-check patterns where the walrus operator (:=)\nwould be more concise and idiomatic. Common patterns include:\n\n1. **Path existence check** (Cache.get pattern):\n   path = self.dir / f"{key}.txt"\n   return path.read_text() if path.exists() else None\n\n   Should use: return (p.read_text() if (p := self.dir / f"{key}.txt").exists() else None)\n\n2. **Git config fallback** (bind-and-test):\n   config_verbose = repo.config.get_bool("commit.verbose")\n   include_verbose = config_verbose if config_verbose is not None else False\n\n   Should use walrus in the conditional to bind and test in one place.\n\n3. **Subprocess return code checks**:\n   rc = await proc.wait()\n   if rc != 0:\n       raise subprocess.CalledProcessError(rc, cmd)\n\n   Should use: if (rc := await proc.wait()) != 0: raise ...\n\n4. **Editor/process return codes**:\n   editor_proc = await create_subprocess_exec(...)\n   rc = await editor_proc.wait()\n   if rc != 0: ...\n\n   Should inline with walrus: if (rc := await editor_proc.wait()) != 0: ...\n\nBenefits of walrus operator (PEP 572):\n- More concise: combines assignment and condition\n- Clearer intent: value is used once, in the test\n- Standard Python idiom for "bind and check" patterns\n- Variable scope is explicit (only exists where needed)\n- Reduces one-off temporary variables\n\nNote: Not applicable when the variable is used multiple times outside\nthe conditional, or when it improves readability to keep them separate.\n',
  should_flag: true,
}
