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
            end_line: 134,
            start_line: 133,
          },
        ],
      },
      note: 'Unnecessary guard for network_mode - should always copy value',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/container_session.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/container_session.py': [
          {
            end_line: 130,
            start_line: 129,
          },
        ],
      },
      note: 'Unnecessary guard for binds - should always copy list (even if empty)',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: "The `_build_host_config` function has unnecessary guards before setting Docker HostConfig fields. These guards make the code more complex without providing any benefit, as Docker accepts empty values or will treat \"none\" as a valid network mode.\n\n**Problem 1: Unnecessary guard for network_mode (lines 133-134)**\n```python\nif opts.network_mode != \"none\":\n    host_config[\"NetworkMode\"] = opts.network_mode\n```\n\nThis guard prevents setting NetworkMode when it's \"none\", but:\n- Docker accepts \"none\" as a valid network mode (explicitly disables networking)\n- The default value for network_mode is \"none\" (line 55), so this guard prevents the default from being set\n- The condition looks scary/suspicious (\"what breaks if we set 'none'?\") without justification\n- Should always copy the value: `host_config[\"NetworkMode\"] = opts.network_mode`\n\n**Problem 2: Unnecessary guard for binds (lines 129-130)**\n```python\nif binds:\n    host_config[\"Binds\"] = binds\n```\n\nThis guard only sets Binds if the list is non-empty, but:\n- Docker accepts empty Binds arrays (equivalent to not setting it)\n- The guard adds complexity without benefit\n- Should always copy: `host_config[\"Binds\"] = binds`\n\n**Why these guards are problematic:**\n- Add unnecessary branching and cognitive load\n- Make the code look suspicious (why guard against empty/default values?)\n- Don't provide any actual benefit (Docker handles these cases fine)\n- Inconsistent with AutoRemove handling (line 118-119, no guard)\n\n**Fix:**\nRemove both guards and always set the values:\n```python\n# Remove the if binds: guard\nhost_config[\"Binds\"] = binds\n\n# Remove the if opts.network_mode != \"none\": guard\nhost_config[\"NetworkMode\"] = opts.network_mode\n```\n",
  should_flag: true,
}
