{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/db/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/db/models.py': [
          {
            end_line: 426,
            start_line: 409,
          },
          {
            end_line: 473,
            start_line: 456,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "`ModelMetadata` (line 409) and `ModelPricing` (line 456) are duplicate database models with identical schemas. Both store the same fields:\n- model_id (primary key)\n- input_usd_per_1m_tokens\n- cached_input_usd_per_1m_tokens\n- output_usd_per_1m_tokens\n- context_window_tokens\n- max_output_tokens\n- updated_at\n\nBoth sync from the same source (`adgn.openai_utils.model_metadata.MODEL_METADATA`) and serve the same purpose (OpenAI model pricing/limits for cost calculation).\n\nThe code inconsistently uses different models for different layers:\n- `ModelMetadata` (table: model_metadata) is used by sync_model_metadata.py and CLI commands (cmd_db.py)\n- `ModelPricing` (table: model_pricing) is used by the run_costs view creation (create_run_costs_view at lines 527, 545)\n\nThis parallel implementation creates maintenance burden: any schema changes must be applied to both models, both tables must be synced, and queries must choose arbitrarily between them. Merge into a single model (keep `ModelMetadata` as it's more semantically accurate - it includes context limits, not just pricing).\n",
  should_flag: true,
}
