local I = import 'lib.libsonnet';

I.issue(
  rationale=|||
    The codebase uses "volumes" terminology while Docker's API internally uses "Binds" in the HostConfig. This creates a terminology mismatch and potential confusion.

    **Docker's API convention:**
    Docker's container creation API uses `HostConfig.Binds` (not "Volumes") for bind mounts. This is documented in the Docker Engine API and used consistently throughout Docker's client libraries including aiodocker.

    **Current state in our code:**
    - `ContainerOptions` dataclass (line 48): `volumes: dict[str, dict[str, str]] | list[str] | None = None`
    - `ContainerSessionState` dataclass (line 34): `volumes: dict[str, dict[str, str]] | list[str] | None`
    - `_build_host_config` function (line 96-129): converts `opts.volumes` to `host_config["Binds"]`
    - Comment on line 111: "Convert volumes to binds format"
    - Comment on line 122: "Volumes already in Docker bind format"

    **Usage locations:**
    - `container_session.py`: lines 112, 113, 115, 121, 123, 125, 237, 248, 393
    - `docker/server.py`: lines 5 (docstring), 85 (resource info)

    **Why this is confusing:**
    - Users familiar with Docker's API will expect "binds" terminology
    - The conversion from "volumes" to "Binds" in `_build_host_config` suggests we're translating between different concepts when it's actually the same concept
    - Comments explicitly acknowledge this is "binds format" (lines 111, 122), reinforcing that we should use Docker's terminology
    - The type annotation `dict[str, dict[str, str]] | list[str]` matches Docker's Binds format exactly, not a different abstraction

    **Recommended fix:**
    Rename the field from `volumes` to `binds` throughout:
    1. `ContainerOptions.volumes` → `ContainerOptions.binds`
    2. `ContainerSessionState.volumes` → `ContainerSessionState.binds`
    3. Update all references (9+ locations)
    4. Update comments and docstrings
    5. Update any external callers that construct ContainerOptions

    This aligns our terminology with Docker's API, making the code more intuitive for anyone familiar with Docker and removing the misleading "conversion" step in `_build_host_config`.

    **Note on Docker volumes vs binds:**
    Docker distinguishes between "volumes" (managed by Docker in `/var/lib/docker/volumes/`) and "bind mounts" (arbitrary host paths). Our code only handles bind mounts (evidenced by the dict format with host paths and the HostConfig.Binds target). Using "volumes" terminology is therefore doubly misleading.
  |||,
  filesToRanges={
    'adgn/src/adgn/mcp/_shared/container_session.py': [
      [34, 34],  // ContainerSessionState.volumes field
      [48, 48],  // ContainerOptions.volumes field
      [39, 39],  // Comment "Raw volumes argument"
      [100, 100],  // _build_host_config docstring mentions volumes
      [111, 125],  // Volume-to-binds conversion logic with comments
      [237, 237],  // volumes=opts.volumes in lifespan (non-ephemeral)
      [248, 248],  // volumes=opts.volumes in lifespan (ephemeral)
      [393, 393],  // volumes=s.volumes in run_ephemeral_container
    ],
    'adgn/src/adgn/mcp/exec/docker/server.py': [
      [5, 5],  // Docstring mentions "RO/RW volumes"
    ],
  },
  expect_caught_from=[
    ['adgn/src/adgn/mcp/_shared/container_session.py'],
    ['adgn/src/adgn/mcp/exec/docker/server.py'],
  ],
)
