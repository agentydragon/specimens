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
            end_line: 34,
            start_line: 34,
          },
          {
            end_line: 48,
            start_line: 48,
          },
          {
            end_line: 39,
            start_line: 39,
          },
          {
            end_line: 100,
            start_line: 100,
          },
          {
            end_line: 125,
            start_line: 111,
          },
          {
            end_line: 237,
            start_line: 237,
          },
          {
            end_line: 248,
            start_line: 248,
          },
          {
            end_line: 393,
            start_line: 393,
          },
        ],
        'adgn/src/adgn/mcp/exec/docker/server.py': [
          {
            end_line: 5,
            start_line: 5,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The codebase uses \"volumes\" terminology while Docker's API internally uses \"Binds\" in the HostConfig. This creates a terminology mismatch and potential confusion.\n\n**Docker's API convention:**\nDocker's container creation API uses `HostConfig.Binds` (not \"Volumes\") for bind mounts. This is documented in the Docker Engine API and used consistently throughout Docker's client libraries including aiodocker.\n\n**Current state in our code:**\n- `ContainerOptions` dataclass (line 48): `volumes: dict[str, dict[str, str]] | list[str] | None = None`\n- `ContainerSessionState` dataclass (line 34): `volumes: dict[str, dict[str, str]] | list[str] | None`\n- `_build_host_config` function (line 96-129): converts `opts.volumes` to `host_config[\"Binds\"]`\n- Comment on line 111: \"Convert volumes to binds format\"\n- Comment on line 122: \"Volumes already in Docker bind format\"\n\n**Usage locations:**\n- `container_session.py`: lines 112, 113, 115, 121, 123, 125, 237, 248, 393\n- `docker/server.py`: lines 5 (docstring), 85 (resource info)\n\n**Why this is confusing:**\n- Users familiar with Docker's API will expect \"binds\" terminology\n- The conversion from \"volumes\" to \"Binds\" in `_build_host_config` suggests we're translating between different concepts when it's actually the same concept\n- Comments explicitly acknowledge this is \"binds format\" (lines 111, 122), reinforcing that we should use Docker's terminology\n- The type annotation `dict[str, dict[str, str]] | list[str]` matches Docker's Binds format exactly, not a different abstraction\n\n**Recommended fix:**\nRename the field from `volumes` to `binds` throughout:\n1. `ContainerOptions.volumes` → `ContainerOptions.binds`\n2. `ContainerSessionState.volumes` → `ContainerSessionState.binds`\n3. Update all references (9+ locations)\n4. Update comments and docstrings\n5. Update any external callers that construct ContainerOptions\n\nThis aligns our terminology with Docker's API, making the code more intuitive for anyone familiar with Docker and removing the misleading \"conversion\" step in `_build_host_config`.\n\n**Note on Docker volumes vs binds:**\nDocker distinguishes between \"volumes\" (managed by Docker in `/var/lib/docker/volumes/`) and \"bind mounts\" (arbitrary host paths). Our code only handles bind mounts (evidenced by the dict format with host paths and the HostConfig.Binds target). Using \"volumes\" terminology is therefore doubly misleading.\n",
  should_flag: true,
}
