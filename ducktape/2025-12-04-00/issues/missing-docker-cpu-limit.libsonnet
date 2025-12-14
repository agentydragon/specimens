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
            end_line: 129,
            start_line: 99,
          },
          {
            end_line: 61,
            start_line: 52,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Docker containers created by ContainerOptions and _build_host_config() do not\nspecify CPU limits. While the containers are otherwise well-isolated, it would be\nhealthy to set explicit CPU constraints to prevent a single container from\nmonopolizing CPU resources.\n\nSetting CPU limits helps:\n- Ensure fair resource sharing when multiple containers run concurrently\n- Make performance characteristics more predictable\n- Prevent accidental CPU exhaustion from runaway processes\n\nDocker supports NanoCpus (fractional CPUs, e.g., 1.5 CPUs = 1500000000 nanocpus)\nand CpuQuota/CpuPeriod in HostConfig. A reasonable default could be 2 CPUs for\nagent runtime containers and 1 CPU for critics/graders.\n\nExample addition to _build_host_config():\n  host_config["NanoCpus"] = opts.nano_cpus or (2 * 1_000_000_000)  # 2 CPUs default\n',
  should_flag: true,
}
