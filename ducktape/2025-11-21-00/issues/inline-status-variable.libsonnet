{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/runtime.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/runtime.py': [
          {
            end_line: 294,
            start_line: 292,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The code has a comment explaining strict validation behavior and an intermediate\nvariable that should be inlined.\n\n**Current code (lines 292-294):**\n```python\n# Strict mapping; surface invalid data rather than swallowing\nstatus = ProposalStatus(raw)\nproposals.append(ProposalInfo(id=pid, status=status))\n```\n\n**Should be:**\n```python\nproposals.append(ProposalInfo(id=pid, status=ProposalStatus(raw)))\n```\n\n**Why delete the comment:**\n- The comment states \"Strict mapping; surface invalid data rather than swallowing\"\n- But this is already obvious from the code: `ProposalStatus(raw)` will raise if invalid\n- Pydantic enum validation is strict by default - this isn't doing anything special\n- The comment adds no value beyond what the code already shows\n- If invalid data is passed, Pydantic will raise ValidationError - this is standard behavior\n\n**Why inline the status variable:**\n- `status` is used exactly once, immediately after creation\n- Variable name doesn't add semantic value beyond `ProposalStatus(raw)`\n- Single-use variable that should be inlined\n- Standard pattern for simple transformations\n\n**Pattern:**\nThis is a common case where a comment explains \"what the code does\" rather than \"why\".\nThe code is self-documenting - calling `ProposalStatus(raw)` on potentially invalid\ndata will raise if it's invalid. No need to comment on standard Pydantic behavior.\n\n**Comparison with good comments:**\nGood comments explain WHY (business logic, workarounds, non-obvious choices).\nThis comment just explains WHAT (validation happens), which is already clear from the code.\n",
  should_flag: true,
}
