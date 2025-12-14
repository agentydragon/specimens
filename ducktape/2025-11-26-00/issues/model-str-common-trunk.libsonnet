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
            end_line: 90,
            start_line: 85,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 86-90 parse model_str with branching logic, but both branches call `.strip()`\non the result. The stripping is common trunk that should be factored out.\n\n**Current:**\n```python\nif ":" in model_str:\n    _prefix, model_name = model_str.split(":", 1)\n    model_name = model_name.strip()\nelse:\n    model_name = model_str.strip()\n```\n\n**Simplified:**\n```python\nif ":" in model_str:\n    _prefix, model_str = model_str.split(":", 1)\nmodel_name = model_str.strip()\n```\n\nSplits model_str if it has ":", then always strips the result.\n',
  should_flag: true,
}
