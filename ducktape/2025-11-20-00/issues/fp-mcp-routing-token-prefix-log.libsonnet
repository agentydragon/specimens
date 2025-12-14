{
  occurrences: [
    {
      files: {
        'adgn/src/adgn/agent/server/mcp_routing.py': [
          {
            end_line: 110,
            start_line: 110,
          },
        ],
      },
      relevant_files: [
        'adgn/src/adgn/agent/server/mcp_routing.py',
      ],
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Critics flagged the invalid-token logging (line 110: `logger.warning(f\"Invalid token:\n{token[:10]}...\")`) as a credential leak - logging partial tokens would be problematic in\nproduction systems. However, this is acceptable in this context because: (a) this is a personal\npet project, not production infrastructure, so the security bar is lower and log storage isn't\ntreated as a security liability, (b) the bearer tokens used are long (cryptographically\nrandom), so 10 characters isn't enough information to be exploitable, and (c) the tokens are\nstored in plaintext JSON files anyway (auth.py:24-36 loads from --auth-tokens file). Anyone\nwith filesystem access to read logs can already read the full tokens from the configuration\nfile, making the log prefix leak moot. While it would be marginally better to log fewer\ncharacters (e.g., 5), or use a hash, the current practice isn't worth fixing for this use case.\n",
  should_flag: false,
}
