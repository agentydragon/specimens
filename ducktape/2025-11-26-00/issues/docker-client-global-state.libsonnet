{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 155,
            start_line: 155,
          },
          {
            end_line: 160,
            start_line: 160,
          },
          {
            end_line: 188,
            start_line: 188,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Lines 155, 160, and 188 in app.py store `docker_client` in `app.state` but only\nuse it locally within the same function where it's created.\n\n**Analysis:**\n- `docker_client` is set once on line 155\n- Accessed ONLY on lines 160 and 188 in the SAME function\n- NEVER accessed elsewhere in the codebase\n- Only used to pass to constructors during initialization\n\n**Problem:**\nPutting it in `app.state` makes it global mutable state unnecessarily. This increases\nthe \"bag of random global state items\", suggests the client might be used elsewhere\n(misleading), and makes usage harder to track.\n\n**Fix:**\nChange line 155 to `docker_client = docker.from_env()` (local variable) and replace\nboth uses of `app.state.docker_client` (lines 160, 188) with `docker_client`.\n\nThis reduces global state, clarifies scope, and makes the code easier to test.\nOnly put things in `app.state` if they need to be accessed from request handlers\nor other parts of the application.\n",
  should_flag: true,
}
