{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/container_session.py',
        ],
        [
          'adgn/src/adgn/mcp/exec/docker/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/container_session.py': [
          {
            end_line: 102,
            start_line: 100,
          },
          {
            end_line: 403,
            start_line: 388,
          },
        ],
        'adgn/src/adgn/mcp/exec/docker/server.py': [
          {
            end_line: 22,
            start_line: 19,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Four functions in `container_session.py` have underscore prefixes (`_session_state_from_ctx`, `_run_session_container`, `_run_ephemeral_container`, `_render_container_result`) despite being imported and used by external modules, specifically `docker/server.py`.\n\n**Python naming convention:**\nUnderscore-prefixed names indicate private/internal functions that should not be used outside their defining module. Functions that are part of a module's public API should not have leading underscores.\n\n**Current state in container_session.py:**\n- `_session_state_from_ctx` (line 100) - extracts session state from FastMCP context\n- `_run_session_container` (line 493) - executes command in per-session container\n- `_run_ephemeral_container` (line 406) - executes command in ephemeral container\n- `_render_container_result` (line 388) - formats container execution result\n\n**Usage in docker/server.py:**\nAll four functions are explicitly imported (lines 19-22) and used:\n- `_session_state_from_ctx`: lines 70, 111\n- `_run_session_container`: line 119\n- `_run_ephemeral_container`: line 117\n- `_render_container_result`: line 122\n\n**Why this is a problem:**\n- Violates Python naming conventions (PEP 8)\n- Misleading - suggests these are private when they're actually public API\n- Makes the code harder to understand (are we breaking encapsulation?)\n- Inconsistent with non-underscore exports from same module (`make_container_lifespan`, `scoped_container`, `ContainerOptions`)\n\n**Fix options:**\n\n**Option 1: Remove underscore prefixes (simple rename)**\n- `_session_state_from_ctx` → `session_state_from_ctx`\n- `_run_session_container` → `run_session_container`\n- `_run_ephemeral_container` → `run_ephemeral_container`\n- `_render_container_result` → `render_container_result`\nUpdate the import statement in `docker/server.py` accordingly.\n\n**Option 2: Restructure module to match actual visibility (recommended)**\nThe current structure suggests these functions were initially intended as internal helpers but evolved into public API. Consider:\n- Move the four public functions into their own module (e.g., `container_exec.py` or make them methods on a public class)\n- Keep truly private helpers (`_build_host_config`, `_create_and_start_container`, etc.) in `container_session.py` with underscores\n- This would make the module boundaries clearer and match the actual usage pattern\n\nAlternative: If these functions are tightly coupled to the session container lifecycle, create a public class (e.g., `ContainerExecutor`) with these as public methods, keeping internal helpers as private methods.\n\n**Truly private functions:**\nOther underscore-prefixed functions in the module that are NOT exported are correctly named as private:\n- `_build_host_config` (line 104)\n- `_create_and_start_container` (line 139)\n- `_race_with_timeout` (line 277)\n- `_kill_container_with_retry` (line 302)\n- `_normalize_docker_logs_to_bytes` (line 319)\n- `_collect_from_exec_stream` (line 355)\n",
  should_flag: true,
}
