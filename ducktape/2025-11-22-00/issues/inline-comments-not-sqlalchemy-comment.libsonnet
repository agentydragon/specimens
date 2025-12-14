{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/models.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/models.py': [
          {
            end_line: 69,
            start_line: 68,
          },
          {
            end_line: 92,
            start_line: 92,
          },
          {
            end_line: 122,
            start_line: 122,
          },
          {
            end_line: 126,
            start_line: 125,
          },
          {
            end_line: 152,
            start_line: 150,
          },
          {
            end_line: 203,
            start_line: 203,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "ORM field definitions use inline Python comments instead of SQLAlchemy's `comment=`\nparameter, preventing database schema documentation.\n\n**Current pattern (models.py, multiple locations):**\n```python\nmcp_config: Mapped[str]  # MCPConfig as JSON\nrun_id: Mapped[str]  # UUID stored as string\nseq: Mapped[int]  # Sequence number within run\n```\n\nInline Python comments are invisible to:\n- Database tools (pgAdmin, DBeaver, etc.)\n- Database introspection (`PRAGMA table_info`, `\\d` in psql)\n- Database migrations (Alembic won't preserve them)\n- DBAs inspecting schema\n\n**Correct approach:**\n\nUse SQLAlchemy's `comment=` parameter on `mapped_column()`:\n```python\nmcp_config: Mapped[str] = mapped_column(comment=\"MCPConfig as JSON\")\nrun_id: Mapped[str] = mapped_column(comment=\"UUID stored as string\")\nseq: Mapped[int] = mapped_column(comment=\"Sequence number within run\")\n```\n\n**Benefits:**\n- Comments visible in database schema\n- Database tools show descriptions\n- Migrations preserve documentation\n- DBAs can understand schema without reading Python code\n- Standard SQLAlchemy feature for schema documentation\n",
  should_flag: true,
}
