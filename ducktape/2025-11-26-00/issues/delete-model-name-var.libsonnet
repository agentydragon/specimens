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
            end_line: 744,
            start_line: 743,
          },
          {
            end_line: null,
            start_line: 753,
          },
          {
            end_line: null,
            start_line: 759,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 743-744 extract `model_name` from config with a comment saying \"Model parsing\nhandled by AppConfig.resolve\". Both the variable and comment are unnecessary.\n\n**Current:**\n```python\n# Model parsing handled by AppConfig.resolve\nmodel_name = config.model_name\n\n# Later used at:\nkey = build_cache_key(model_name, ...)  # line 752-753\nProduceMessageInput(..., model_name=model_name, ...)  # line 759\n```\n\n**Problems:**\n1. `model_name` is used only twice, both could use `config.model_name` directly\n2. Comment is useless - it's obvious that AppConfig.resolve handles parsing\n3. Extra variable to track for no benefit\n\n**Fix:**\n- Delete lines 743-744\n- Line 753: Use `config.model_name` instead of `model_name`\n- Line 759: Use `config.model_name` instead of `model_name`\n\n**Benefits:**\n1. Fewer variables\n2. Clear where value comes from (config)\n3. No useless comment\n",
  should_flag: true,
}
