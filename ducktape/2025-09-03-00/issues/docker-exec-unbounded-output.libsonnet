{
  occurrences: [
    {
      expect_caught_from: [
        [
          'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py',
        ],
      ],
      files: {
        'llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py': [
          {
            end_line: 200,
            start_line: 146,
          },
          {
            end_line: 250,
            start_line: 241,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Docker Exec MCP returns unbounded stdout/stderr data, which is hazardous for MCP/LLM agents and\ncan also lead to process memory growth.\n\nPrimary impact (MCP/LLM):\n- Tool responses are fed back into an LLM context. Returning megabytes of text will quickly\n  blow the caller’s context/window, causing truncation, failures, or severe quality drops.\n  MCP tools must bound returned payload size.\n\nSecondary impact (server memory):\n- The server accumulates stdout/stderr into bytearrays with no cap. Very chatty commands can\n  cause high memory usage or OOM over time.\n\nObserved (specimen paths):\n- llm/adgn_llm/src/adgn_llm/mcp/docker_exec/server.py collects into bytearrays without limits\n  and returns the full decoded strings in the tool payload.\n\nAcceptance criteria (bounded capture in MCP response):\n- Enforce an upper bound (bytes or characters) for stdout/stderr included in the tool return\n  (e.g., first N bytes, with a clear truncation note and total sizes).\n- Keep full data optional (e.g., tee to a temp file/log and return a path/reference), but the\n  MCP tool’s returned text must be bounded deterministically.\n- Document the cap and truncation behavior in the tool description so callers can plan.\n\nOptional (server memory hygiene):\n- Apply the same bound in the in-process accumulation path, or stream/tee to a file to avoid\n  unbounded memory growth while still allowing capped returns.\n',
  should_flag: true,
}
