{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/mcp_routing.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/mcp_routing.py': [
          {
            end_line: 63,
            start_line: 60,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 60-63 define TOKEN_TABLE with hardcoded mock data: `{"human-token-123": ...,\n"agent-token-abc": ...}`. The comment "In production, this would be a database lookup\nor external service" indicates temporary/mock code.\n\nThe codebase already has a real implementation: TokenMapping class in\nadgn/src/adgn/agent/mcp_bridge/auth.py (lines 24-58) reads token mappings from JSON files\nwith proper error handling (FileNotFoundError, ValueError), reload() method, and get_agent_id()\nlookups.\n\nTOKEN_TABLE should use a similar file-based approach extended to support both human and agent\ntokens with their metadata (role, agent_id). Replace hardcoded mock data with a configuration\nclass that parses JSON/YAML into TokenInfo objects using Pydantic. Update tests to use fixture\nfiles instead of patching the global.\n\nCould unify with TokenMapping for a single token configuration file serving both purposes.\n',
  should_flag: true,
}
