{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/container_session.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/container_session.py': [
          {
            end_line: 54,
            start_line: 54,
          },
          {
            end_line: 130,
            start_line: 122,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `_build_host_config` function silently ignores `opts.volumes` when it's a `list[str]`, despite `list[str]` being an explicitly allowed type in the type signature.\n\n**Type declaration (line 54):**\n```python\nvolumes: dict[str, dict[str, str]] | list[str] | None = None\n```\n\n**Implementation (lines 122-130):**\n```python\nif opts.volumes and isinstance(opts.volumes, dict):\n    binds = []\n    for host_path, volume_config in opts.volumes.items():\n        bind = f\"{host_path}:{volume_config['bind']}\"\n        if mode := volume_config.get(\"mode\"):\n            bind += f\":{mode}\"\n        binds.append(bind)\n    if binds:\n        host_config[\"Binds\"] = binds\n```\n\nThe code only handles the `dict` case. If `opts.volumes` is a `list[str]` (which is valid according to the type), the volumes are silently ignored - no error, no warning, just skipped.\n\n**Why this is a problem:**\n- Silent failures are dangerous - users won't know their volumes aren't being mounted\n- Type signature promises support for `list[str]`, but implementation doesn't deliver\n- Violates the principle of least surprise (type-checked code fails at runtime)\n\n**Docker Binds format:**\nDocker expects binds as a list of strings in the format `\"host_path:container_path:mode\"` (mode is optional). So if `volumes` is already a `list[str]`, it likely needs minimal transformation or might already be in the correct format.\n\n**Fix options:**\n\n**Option 1: Support list[str] format**\nHandle the `list[str]` case by passing it through or transforming it:\n```python\nif opts.volumes:\n    if isinstance(opts.volumes, dict):\n        binds = []\n        for host_path, volume_config in opts.volumes.items():\n            bind = f\"{host_path}:{volume_config['bind']}\"\n            if mode := volume_config.get(\"mode\"):\n                bind += f\":{mode}\"\n            binds.append(bind)\n    elif isinstance(opts.volumes, list):\n        binds = opts.volumes  # Already in Docker bind format\n    else:\n        raise TypeError(f\"volumes must be dict or list, got {type(opts.volumes)}\")\n    host_config[\"Binds\"] = binds\n```\n\n**Option 2: Remove list[str] from type if unsupported**\nIf `list[str]` isn't actually supported, remove it from the type signature:\n```python\nvolumes: dict[str, dict[str, str]] | None = None\n```\nThis makes the type honest about what's actually supported.\n\n**Option 3: Raise error on unsupported type**\nKeep the type but explicitly error on unsupported values:\n```python\nif opts.volumes:\n    if isinstance(opts.volumes, list):\n        raise ValueError(\"list[str] volumes not yet implemented\")\n    # ... existing dict handling\n```\n",
  should_flag: true,
}
