{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/auth.py',
        ],
        [
          'adgn/src/adgn/props/eval_harness.py',
        ],
        [
          'adgn/src/adgn/mcp/stubs/typed_stubs.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/auth.py': [
          {
            end_line: 116,
            start_line: 113,
          },
        ],
        'adgn/src/adgn/mcp/stubs/typed_stubs.py': [
          {
            end_line: 207,
            start_line: 205,
          },
          {
            end_line: 183,
            start_line: 181,
          },
        ],
        'adgn/src/adgn/props/eval_harness.py': [
          {
            end_line: 581,
            start_line: 580,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Multiple locations extract values and immediately test or use them, where the\nwalrus operator (:=) would combine assignment and usage more idiomatically.\n\n**Pattern 1: os.environ.get with immediate check** (auth.py:113-116):\nenv_token = os.environ.get(\"ADGN_UI_TOKEN\")\nif env_token:\n    logger.info(\"Using ADGN_UI_TOKEN from environment\")\n    return env_token\n\nShould use: if env_token := os.environ.get(\"ADGN_UI_TOKEN\"):\n\n**Pattern 2: Create object and immediately use** (eval_harness.py:580-581):\neval_index = EvalIndex(samples=list(entries))\n(root / \"index.json\").write_text(eval_index.model_dump_json(...), ...)\n\nThe variable is needed later but can be created inline:\n(root / \"index.json\").write_text((eval_index := EvalIndex(samples=list(entries))).model_dump_json(...), ...)\n\n**Pattern 3: dict.get with None check** (typed_stubs.py:205-207):\nmodels = self._models.get(name)\nif not models:\n    raise AttributeError(name)\n\nShould use: if not (models := self._models.get(name)):\n\nBenefits of walrus operator (PEP 572):\n- Combines retrieval and check into one line\n- More concise without sacrificing readability\n- Standard Python 3.8+ pattern for \"get and check\" scenarios\n- Variable scope is correctly limited to where it's needed\n- Consistent with modern Python idioms\n\nNote: These transformations maintain the same behavior while reducing\nline count and making the bind-and-test pattern explicit.\n",
  should_flag: true,
}
