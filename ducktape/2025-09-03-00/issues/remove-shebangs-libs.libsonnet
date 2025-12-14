{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/git_commit_ai/cli.py': [
          {
            end_line: null,
            start_line: 1,
          },
        ],
      },
      note: 'shebang on library module exposed via console_scripts',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py': [
          {
            end_line: null,
            start_line: 1,
          },
        ],
      },
      note: 'shebang on library module exposed via console_scripts',
      occurrence_id: 'occ-1',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/jupyter_mcp_launch.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/jupyter_mcp_launch.py': [
          {
            end_line: null,
            start_line: 1,
          },
        ],
      },
      note: 'shebang on library module exposed via console_scripts',
      occurrence_id: 'occ-2',
    },
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/jupyter_sandbox_compose.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/sandboxed_jupyter_mcp/jupyter_sandbox_compose.py': [
          {
            end_line: null,
            start_line: 1,
          },
        ],
      },
      note: 'shebang on library module exposed via console_scripts',
      occurrence_id: 'occ-3',
    },
  ],
  rationale: 'Modules under packages that are executed via console_scripts should not carry a `#!/usr/bin/env python3`\nshebang or be executable; the packaging shim handles invocation. Keeping shebangs on importable modules\nis misleading and unnecessary. Remove the shebang from library modules; reserve shebangs for true scripts\nunder bin/ (if any).\n',
  should_flag: true,
}
