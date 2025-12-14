{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/sandboxed_jupyter/launch.py': [
          {
            end_line: 146,
            start_line: 146,
          },
          {
            end_line: 171,
            start_line: 165,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "run_jupyter_mcp starts a Jupyter server at line 146 but the try/finally cleanup block\ndoesn't start until line 165. If any operation between lines 147-164 raises (building\nmcp_cmd, validation, etc.), the try block is never entered, so the finally block never\nexecutes, leaving the Jupyter server process running. The finally block only protects\nagainst failures inside the try block (subprocess.Popen and proc.wait), not failures\nbefore entering it.\n\nA more robust pattern would wrap the server in a context manager that guarantees cleanup\nvia Python's __exit__ protocol. This makes it impossible to acquire the server resource\nwithout automatic cleanup, eliminating the fragile dependency on try block placement:\n@contextmanager def _jupyter_server_context(...) with yield and finally cleanup, then\nuse it via \"with _jupyter_server_context(...) as jl:\". The context manager ensures\ncleanup runs even on exception or early return, and makes resource ownership explicit.\n",
  should_flag: true,
}
