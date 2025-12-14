{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/sandboxed_jupyter/wrapper.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/sandboxed_jupyter/wrapper.py': [
          {
            end_line: 43,
            start_line: 42,
          },
          {
            end_line: 358,
            start_line: 358,
          },
          {
            end_line: 372,
            start_line: 372,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The --document-id CLI help text (lines 358, 372) states "Notebook path relative to workspace;\nif missing, a new timestamped notebook is created", implying that when a document ID is\nprovided, the wrapper should open that existing notebook if it exists, and only create a new\none if missing. However, _ensure_document_id unconditionally raises FileExistsError when the\ntarget path already exists (lines 42-43), making it impossible to reopen existing notebooks.\nBoth run_seatbelt and run_docker call _ensure_document_id with user-provided document IDs,\nso any attempt to use --document-id with an existing notebook crashes before Jupyter starts.\n',
  should_flag: true,
}
