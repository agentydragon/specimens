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
            end_line: 226,
            start_line: 220,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 220-226 in runtime.py use an imperative for-loop with `.append()` to build\na list, when a list comprehension would be more Pythonic. Additionally, it has\nredundant type conversions and a useless comment.\n\n**Problems:**\n1. Imperative loop instead of comprehension (non-idiomatic Python)\n2. Useless comment - \"Strict mapping; surface invalid data\" doesn't explain anything\n   since ProposalStatus enum constructor already raises ValueError on invalid data\n   (standard enum behavior)\n3. Redundant `str()` conversions - both `r.id` and `r.status` are already `str`\n   (PolicyProposal has `id: str`, `status: str`)\n4. `rows` variable used only once\n\n**Fix:**\nReplace with list comprehension:\n`proposals = [ProposalInfo(id=r.id, status=ProposalStatus(r.status)) for r in rows]`\nor inline `rows` if the method call isn't too long.\n\nThis is more Pythonic, eliminates redundant conversions, removes the useless comment,\nand clearly expresses the data transformation.\n",
  should_flag: true,
}
