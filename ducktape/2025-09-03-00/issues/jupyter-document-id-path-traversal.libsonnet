{
  occurrences: [
    {
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/wrapper.py': [
          {
            end_line: 52,
            start_line: 37,
          },
          {
            end_line: 506,
            start_line: 480,
          },
        ],
      },
      relevant_files: [
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/wrapper.py',
      ],
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'False positive: document_id is CLI-controlled (wrapper --document-id), not an MCP tool input.\nThe value is used to create a notebook path under the configured workspace; this is an internal\nparameter under our control rather than an untrusted input.\n',
  should_flag: false,
}
