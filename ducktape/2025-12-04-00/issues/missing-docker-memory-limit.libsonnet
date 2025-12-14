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
  rationale: 'Docker containers created by ContainerOptions and _build_host_config() do not\nspecify memory limits. While containers are isolated by network mode ("none") and\nread-only volumes, it would be healthier to set explicit memory constraints.\n\nSetting memory limits helps:\n- Prevent runaway processes from affecting host stability\n- Make resource usage predictable and debuggable\n- Align with containerization best practices\n\nDocker supports Memory (hard limit) and MemoryReservation (soft limit) in HostConfig.\nA reasonable default could be 2-4GB for agent runtime containers and 1-2GB for\ncritics/graders, with the option to override per use case.\n\nExample addition to _build_host_config():\n  host_config["Memory"] = opts.mem_limit or (2 * 1024 * 1024 * 1024)  # 2GB default\n',
  should_flag: true,
}
