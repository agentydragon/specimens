{
  occurrences: [
    {
      expect_caught_from: [
        [
          'internal/app/lsp.go',
        ],
      ],
      files: {
        'internal/app/lsp.go': [
          {
            end_line: 18,
            start_line: 14,
          },
        ],
        'internal/llm/agent/mcp_manager.go': [
          {
            end_line: 80,
            start_line: 78,
          },
        ],
        'internal/llm/prompt/coder.go': [
          {
            end_line: 114,
            start_line: 114,
          },
        ],
        'internal/tui/components/lsp/lsp.go': [
          {
            end_line: 63,
            start_line: 63,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "LSPConfig.Disabled flag doesn't prevent LSP initialization - disabled LSP servers still start and run.\n\ninitLSPClients (internal/app/lsp.go:14-18) iterates over all configured LSPs and starts every one without checking the Disabled flag:\n\nfor name, clientConfig := range app.config.LSP {\n    go app.createAndStartLSPClient(ctx, name, clientConfig.Command, clientConfig.Args...)\n}\n\nResult: Disabled LSP servers still spawn processes, connect, initialize, and run workspace watchers.\n\nThe Disabled field is only checked for:\n- TUI display (internal/tui/components/lsp/lsp.go:63) to show \"disabled\" label\n- Prompt building (internal/llm/prompt/coder.go:114) to omit LSP info from system prompt\n\nBut the actual LSP process runs regardless, consuming resources and file descriptors.\n\nCompare to MCP initialization (internal/llm/agent/mcp_manager.go:78-80), which correctly checks the flag:\n\nif mc.Disabled {\n    updateMCPState(name, MCPStateDisabled, nil, nil, 0)\n    return\n}\n\nFix: Add early-return check in initLSPClients loop before calling createAndStartLSPClient.\n",
  should_flag: true,
}
