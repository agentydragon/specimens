{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/compositor/clients.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/compositor/clients.py': [
          {
            end_line: 23,
            start_line: 17,
          },
          {
            end_line: 48,
            start_line: 26,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `CompositorAdminClient` in compositor/clients.py (lines 17-48) does not follow the standard typed MCP server stub pattern used throughout the codebase.\n\n**Current problems:**\n1. Lines 17-23 define private `_AttachServerArgs` and `_DetachServerArgs` models that duplicate the public models already defined in compositor/admin.py (lines 10-18: `AttachServerArgs`, `DetachServerArgs`)\n2. Lines 26-48 manually construct tool calls using `build_mcp_function` and `call_simple_ok`, which is low-level and error-prone\n3. The client doesn't benefit from the typed stub infrastructure's automatic validation and error handling\n\n**The codebase has a standard pattern for typed MCP clients:**\n- Define a stub class that extends `ServerStub` (from `adgn.mcp.stubs.server_stubs`)\n- Declare methods with proper input/output types and `raise NotImplementedError`\n- The framework auto-wires the methods to actual tool calls at runtime\n\n**Example from approval_policy/clients.py (lines 14-28):**\n```python\nclass PolicyReaderStub(ServerStub):\n    async def evaluate_policy(self, input: PolicyRequest) -> PolicyResponse:\n        raise NotImplementedError  # Auto-wired at runtime\n```\n\n**What should be done:**\nThe CompositorAdminClient should be replaced with a typed stub that:\n1. Extends `ServerStub`\n2. Imports and reuses the public `AttachServerArgs` and `DetachServerArgs` from compositor/admin.py (no duplication)\n3. Declares typed methods like `async def attach_server(self, input: AttachServerArgs) -> SimpleOk: raise NotImplementedError`\n4. Relies on the framework's auto-wiring instead of manual tool name construction and calling\n\nThis would eliminate code duplication, improve type safety, and follow established codebase conventions.\n",
  should_flag: true,
}
