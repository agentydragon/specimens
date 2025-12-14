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
            end_line: 291,
            start_line: 291,
          },
          {
            end_line: 449,
            start_line: 449,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'run_seatbelt calls _ensure_document_id twice on the same document path, causing a crash\non the second call. At line 449, run_seatbelt calls _ensure_document_id(ws, document_id),\nwhich either generates a unique timestamped path (if document_id is None) or uses the\nprovided path, creates the notebook file, and returns the path. Then at line 460,\nrun_seatbelt calls _seatbelt(..., document_id=doc_id), which calls _ensure_document_id\nagain at line 291 with the same path. Since _ensure_document_id raises FileExistsError\nwhen the target file already exists (line 42), the second call always crashes.\n',
  should_flag: true,
}
